<?php
namespace src\app\Middleware;

use mukto90\Ncrypt;
use src\app\Models\User as Users;
use src\config\Api_Controller;

class JAuth extends Api_Controller
{

    public function __construct()
    {
        global $app;
        $this->slim = $app;
        $this->app = $app->getContainer();
        // $this->args=$app->args();
        $this->db = $this->app['db'];
        $this->request = $this->app['request'];
        $this->response = $this->app['response'];
        $this->logger = $this->app['logger'];
        $this->env = $this->app['environment'];
        $this->view = $this->app['view'];
        $this->uri = $this->request->getUri();
        $this->input = $this->request->getParsedBody();
        // parent::__construct();
        $this->ncrypt = new Ncrypt();
        $this->ncrypt->set_secret_key($this->env['oauth_secret_key']);
        $this->ncrypt->set_secret_iv($this->env['oauth_secret_iv']);
        $this->ncrypt->set_cipher('AES-256-CBC'); //optional

        // c url  $this->request->getUri()->getPath();

    }

    public function __invoke($request, $response, $next)
    {
        ($this->key_check()) ? '' : die($this->key_failed());
        $response = $next($request, $response);
        //after
        return $response;
    }
    public function key_check()
    {
        $headers = apache_request_headers();
        $token = $headers['token'];
        $tokenstring = $this->ncrypt->decrypt($token);
        $tokendata = explode(",", unserialize($tokenstring));
        if (!empty($tokendata)) {
            $useridFromtoken = $tokendata[0];
            $useridFromTime = $tokendata[1];

            $userdata = array(
                'u_id' => $useridFromtoken,
                'u_token' => $token,
            );
            $count = Users::where($userdata)->count();

            if ($count > 0) {
                return true;

            } else {
                return false;
            }
        } else {
            return false;
        }

    }

    public function key_failed()
    {
        $headers = apache_request_headers();
        $token = $headers['token'];

        $output = array(
            "status" => false,
            "data" => array(),
            "message" => "access token failed",
            "token_received" => $token,
        );
        return $this->response->withJson($output)->withStatus(401);

    }
}
