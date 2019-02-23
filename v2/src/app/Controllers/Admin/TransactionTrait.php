<?php
namespace src\app\Controllers\Admin;
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
		$connection->commit();
	}
	public function rollbackTransaction() {
		$connection = $this->db->getConnection();
		$connection->rollback();
	}
}

?>