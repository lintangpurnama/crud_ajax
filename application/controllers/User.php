<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
    }

    public function index()
    {
        $data['role'] = $this->db->get('role')->result();
        $data['user'] = $this->User_model->getData();
        $this->load->view('index1', $data);
    }
    // function ambilData()
    // {
    //     $data = $this->User_model->getData();


    //     // Menampung value return dari fungsi getData ke variabel data

    //     echo json_encode($data); // Mengencode variabel data menjadi json format
    // }

    function tambahData()
    {
        $photo = $_FILES['photo']['name'];
        if ($photo) {
            $config['upload_path']          = './assets/photo/';
            $config['allowed_types']        = 'gif|jpg|png|jpege';
            $config['max_size']             = 2048;
            $config['encrypt_name']             = TRUE;

            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('photo')) //sesuai name yg ada di form
            {
                echo $this->upload->display_errors();
            } else {
                // $data['photo'] = $this->upload->data('file_name'); //ambil nama file
                $this->input->post('photo');
            }
        }
        $username    = $this->input->post('username'); //Menangkap inputan no induk
        $role       = $this->input->post('id_role'); //Menangkap inputan role
        // $photo     = $this->input->post('photo'); //Menangkap inputan photo
        $status       = $this->input->post('status'); //Menangkap inputan status

        $data = [
            'username' => $username,
            'id_role' => $role,
            'status' => $status,
            'photo' => $photo
        ];
        $data = $this->User_model->insertData($data);

        echo json_encode($data); // Mengencode variabel data menjadi json format
    }
    //
}
