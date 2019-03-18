<?php

namespace src\config;

class Api_Controller {
	public $app, $db, $request, $response, $logger, $env;

	public function __construct() {
		global $app;
		$this->slim = $app;
		$this->app = $app->getContainer();
		// $this->args=$app->args();
		$this->db = $this->app['db'];
		$this->request = $this->app['request'];
		$this->response = $this->app['response'];
		$this->logger = $this->app['logger'];
		$this->view = $this->app['view'];
		$this->uri = $this->request->getUri();
		$this->input = $this->request->getParsedBody();
		$this->env = $this->app['environment'];
		$this->self = $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath();
		$DB_NAME = get_env('DB_NAME', 'themoovapp_test');
		$DB_HOST = get_env('DB_HOST');

		$dsn = "mysql:host={$DB_HOST};dbname={$DB_NAME};charset=utf8";
		$this->pdo = new \Slim\PDO\Database($dsn, get_env('DB_USER'), get_env('DB_PASS'));

		// c url  $this->request->getUri()->getPath();

	}

	/**
	 * Starts a database transaction
	 */
	public function beginTransaction() {
		$connection = $this->db->getConnection();
		$connection->beginTransaction();
	}
	/**
	 * Commits a database transaction
	 */
	public function commitTransaction() {
		$connection = $this->db->getConnection();
		$connection->commit();
	}
	/**
	 * Undo a database transaction
	 */
	public function rollbackTransaction() {
		$connection = $this->db->getConnection();
		$connection->rollback();
	}

}
