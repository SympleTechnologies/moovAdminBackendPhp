<?php
namespace src\app\Controllers;
/**
 * summary
 */
trait TransactionTrait {
	/**
	 * summary
	 */
	public function beginTransaction() {
		$connection = $this->db->getConnection();
		$connection->beginTransaction();
	}
	/**
	 * summary
	 */
	public function commitTransaction() {
		$connection = $this->db->getConnection();
		$connection->beginTransaction();
	}
}