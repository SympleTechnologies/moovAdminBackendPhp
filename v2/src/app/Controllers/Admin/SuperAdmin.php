<?php
namespace src\app\Controllers\Admin;
use src\app\Controllers\Admin\BaseAdmin;
use src\app\Models\PriceShare;
use src\app\Models\School;
use src\config\Mail_Controller;

class SuperAdmin extends BaseAdmin {
	use AdminTraits;
	use DriverTraits;
	use SchoolTraits;
	use RideTraits;
	use PaymentTraits;
	use SupportTraits;
	use FilterTraits;
	use EmailTraits;

	public function __construct() {
		parent::__construct();
	}

	public function listPriceShares($req, $res) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		//$priceshares = PriceShare::all();
		$query = PriceShare::query();
		$priceshares = $query->join('edu_institution', 'price_share.school_id', 'edu_institution.ei_id')
			->get();

		$results = [];
		foreach ($priceshares as $priceshare) {
			$s = [
				'schoolid' => $priceshare->ei_id,
				'schoolname' => $priceshare->ei_name,
				'moov' => $priceshare->moov,
				'driver' => $priceshare->driver,
				'school' => $priceshare->institution,
			];
			$results[] = $s;
		}
		$res->getBody()->write(\json_encode([
			'price_shares' => $results,
			'status' => 200,
		]));
	}

	public function addPriceShare($req, $res) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$v = $this->validateRequired(array("school_id", 'moov', 'driver', 'school'), $this->input);
		if ($v !== true) {
			return $res->getBody()->write(json_encode([
				'status' => 403, 'message' => $v,
			]));
		}

		$ps = PriceShare::where('school_id', $this->input['school_id'])->first();
		if (!\is_null($ps)) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'An entry already exists for this school']));
		}

		$pc = new PriceShare();
		$pc->school_id = $this->input['school_id'];
		$pc->moov = $this->input['moov'];
		$pc->driver = $this->input['driver'];
		$pc->institution = $this->input['school'];
		$pc->save();
		$this->sendPriceChangeNotification($pc);

		$res->getBody()->write(json_encode([
			'status' => 200, 'message' => 'Price share info has been saved successfully',
		]));
	}

	public function updatePriceShare($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$v = $this->validateRequired(array('moov', 'driver', 'institution'), $this->input);
		if ($v !== true) {
			return $res->getBody()->write(json_encode([
				'status' => 403, 'message' => $v,
			]));
		}

		$schoolid = (int) $args['id'];
		$priceshare = PriceShare::where('school_id', $schoolid)->first();
		if (\is_null($priceshare)) {
			return $this->notFound($res);
		}

		$priceshare->moov = (int) $this->input['moov'];
		$priceshare->driver = (int) $this->input['driver'];
		$priceshare->institution = (int) $this->input['institution'];

		$priceshare->save();
		$this->sendPriceChangeNotification($priceshare);
		$res->getBody()->write(\json_encode([
			'status' => 200, 'message' => 'Price Share Updated',
		]));
	}
	public function sendPriceChangeNotification($priceshare) {
		$emailController = new Mail_Controller();
		$school = School::find($priceshare->school_id);
		$maildata = array(
			"to" => $school->ei_email,
			'subject' => "Moov price sharing percentage changes",
			'view_page' => 'emails/price_share_amount.html',
			'view_data' => array(
				'school' => $school,
				'priceshare' => $priceshare,
			),
		);
		return $emailController->send_mail($maildata);

	}
}
?>