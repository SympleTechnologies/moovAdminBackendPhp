<?php
namespace src\app\Controllers\Admin;

use src\app\Controllers\Admin\BaseAdmin;

class Admin extends BaseAdmin{
	use AdminTraits;

	public function __construct(){
		parent::__construct();
	}
}
?>