<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('user_model');
		$this->load->model('settings_model');
	}

	public function index()
	{

		// $passDefault = password_hash('12345', PASSWORD_DEFAULT);
		// var_dump($passDefault);
		// die;

		$this->form_validation->set_rules('email', 'Email', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if($this->form_validation->run() == FALSE){
			$data = array(
				'title' => $this->settings_model->getSettings('1')->row()->website_name,
				'getDataWeb' => $this->settings_model->getSettings('1')->row()
			);
			
			$this->load->view('admin/login',$data);
		}
		else {
			//Success
			if($this->input->post()){
				$post = $this->input->post();
				//Cari user by email
				$where1 = $post["email"];
				$user = $this->user_model->getUserByUsername1($where1)->row();

				// var_dump($user);
				// die;

				//Jika user terdaftar
				if($user){
					//Cek pw
					$isPasswordTrue = password_verify($post["password"], $user->password);

					//Generate session
					$array = array(
						'user_id' => $user->user_id,
						'username' => $user->username
					);

					$this->session->set_userdata($array);

					if($isPasswordTrue){
						redirect('admin/Dashboard');
						return true;
					}
					else{
						$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert"><strong>Upss </strong>Password Anda tidak sesuai!</div>');
						redirect('login');
					}
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><strong>Upss </strong>Username tidak teregistrasi!</div>');
					redirect('login');
				}
			}
		}  
	}

	public function logout() {
		$this->session->unset_userdata('user_id');
		$this->session->unset_userdata('username');
		
		$this->session->sess_destroy();
		redirect('login');
	}
}
