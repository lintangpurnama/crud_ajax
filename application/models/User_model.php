<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{
    public function getData()
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->join('role', 'role.id_role = user.id_role');
        // if ($this->db->get_where('user', ['nama' => 'lintang'])->row_array()) {
        //     echo 'heheh';
        // } else {
        //     echo 'a';
        // }
        return $this->db->get()->result_array();
    }

    // public function getData()
    // {
    //     return $this->db->get('user')->result_array();
    // }
    function insertData($data)
    {
        $this->db->insert('user', $data); // menginsert pada tb_siswa dengan variabel data
    }
}
