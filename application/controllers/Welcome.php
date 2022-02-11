<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Welcome extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		// $this->load->model('User_model');
	}

	public function index()
	{
		$data = $this->load->view('index');
	}
	// function tampilkanData()
	// {
	// 	echo 'a';
	// }
}
