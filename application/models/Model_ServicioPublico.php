<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Model_ServicioPublico extends CI_Model
{
           public function __construct()
          {
              parent::__construct();
            // $this->db->free_db_resource();
          }

       function GetServicioAsociado(){
          $ServicioAsociado=$this->db->query("execute sp_Servicio_PublicoA_r");//listar de servicio publico asociado
            if($ServicioAsociado->num_rows()>0)
             {
              return $ServicioAsociado->result();
             }else
             {
              return false;
             }
       }
      function AddServicioAsociado($textarea_servicio_publicoA){

           $this->db->query("execute sp_Servicio_PublicoA_c '".$textarea_servicio_publicoA."'");
            if($this->db->affected_rows()> 0)
             {
              return true;
             }else
             {
              return false;
             }
       }
       
       function UpdateServicioAsociado($id_servicio_publicoA,$textarea_servicio_publicoA){
           $this->db->query("execute sp_Servicio_PublicoA_u '".$id_servicio_publicoA."','".$textarea_servicio_publicoA."'");
            if($this->db->affected_rows() > 0)
             {
              return true;
             }else
             {
              return false;
             }
       }
      
      
}