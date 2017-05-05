<?php
defined('BASEPATH') or exit('No direct script access allowed');
class TipologiaInversion_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        // $this->db->free_db_resource();

    }
    public function get_TipologiaInversion($flat, $txt_IdTipologiaInversion, $txt_NombreTipologiaInversion, $txt_DescripcionTipologiaInversion, $user)
    {
        //  $TipologiaInversion = $this->db->query("execute get");
        $TipologiaInversion = $this->db->query("execute SP_GESTIONAR_TIPOLOGIAINVERSION'" . $flat . "','" . $txt_IdTipologiaInversion . "', '" . $txt_NombreTipologiaInversion . "','" . $txt_DescripcionTipologiaInversion . "','" . $user . "' ");
        if ($TipologiaInversion->num_rows() > 0) {
            return $TipologiaInversion->result();
        } else {
            return false;
        }
    }

    public function AddTipologiaInversion($flat, $txt_IdTipologiaInversion, $txt_NombreTipologiaInversion, $txt_DescripcionTipologiaInversion, $user)
    {

        $this->db->query("execute SP_GESTIONAR_TIPOLOGIAINVERSION'" . $flat . "','" . $txt_IdTipologiaInversion . "', '" . $txt_NombreTipologiaInversion . "','" . $txt_DescripcionTipologiaInversion . "','" . $user . "' ");
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }
    public function EliminarTipologiaInversion($flat, $txt_IdTipologiaInversion, $txt_NombreTipologiaInversion, $txt_DescripcionTipologiaInversion, $user)
    {

        $this->db->query("execute SP_GESTIONAR_TIPOLOGIAINVERSION'" . $flat . "','" . $txt_IdTipologiaInversion . "', '" . $txt_NombreTipologiaInversion . "','" . $txt_DescripcionTipologiaInversion . "','" . $user . "' ");
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }
    public function UpdateTipologiaInversion($flat, $txt_IdTipologiaInversionM, $txt_NombreTipologiaInversionM, $txt_DescripcionTipologiaInversionM, $user)
    {

        $this->db->query("execute SP_GESTIONAR_TIPOLOGIAINVERSION'" . $flat . "','" . $txt_IdTipologiaInversionM . "', '" . $txt_NombreTipologiaInversionM . "','" . $txt_DescripcionTipologiaInversionM . "','" . $user . "' ");
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }

    }

}