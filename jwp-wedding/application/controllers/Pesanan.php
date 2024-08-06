<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pesanan extends CI_Controller {
    public function __construct() {
		parent::__construct();
        $this->load->model('settings_model');
        $this->load->model('pesanan_model');
	}

	public function index()
	{
        $data = array(
            'title' => $this->settings_model->getSettings('1')->row()->website_name,
            'page' => 'landing/pesanan',
            'getAllPesanan' => $this->pesanan_model->get_all_pesanan()->result(),
            'getDataWeb' => $this->settings_model->getSettings('1')->row()
        );
        
		$this->load->view('landing/template/sites',$data);
	}
}
