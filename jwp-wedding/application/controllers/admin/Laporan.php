<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan extends CI_Controller {

    public function __construct() {
		parent::__construct();
		
        if(empty($this->session->userdata('username'))){
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><strong>Upss! </strong>Anda tidak memiliki akses, silakan login.</div>');
            redirect('login');
        }
        $this->load->model('pesanan_model');
        $this->load->model('settings_model');
	}

	public function index()
	{
        $data = array(
            'title' => $this->settings_model->getSettings('1')->row()->website_name,
            'page' => 'admin/laporan',
            'getAllLaporan' => $this->pesanan_model->get_all_laporan()->result(),
            'getDataWeb' => $this->settings_model->getSettings('1')->row()
        );
        
		$this->load->view('admin/template/main',$data);
	}
}
