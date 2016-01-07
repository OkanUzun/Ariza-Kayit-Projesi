using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class AfterLogin : System.Web.UI.Page
{
       String mus_id; 
       String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
       OracleConnection baglanti;
       OracleCommand komut;
       OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        mus_id_cek();
        if (marka.Items.Count == 1) {
            baglanti_kur();
            komut.CommandText = "SELECT DISTINCT TEL_MARKA FROM T_TELEFON";
            rd = komut.ExecuteReader();
            while(rd.Read()) 
                marka.Items.Add(rd["TEL_MARKA"].ToString());        
            baglanti.Close();  
        }          
    }
    protected void Ariza_Kayit_Ekle(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "insert into t_ariza_kayit(tel_marka,tel_model,tel_aciklama,mus_id) values('" + marka.SelectedItem.ToString() + "','" + model.SelectedItem.ToString() + "','" + Aciklama_TB.Text.ToString() + "','" + Convert.ToInt32(Session["mus_id"]) + "')";
        komut.ExecuteNonQuery();
        baglanti.Close();
        Page.Response.Redirect("ArizaListe.aspx");
    }

    protected void marka_SelectedIndexChanged(object sender, EventArgs e)
    {
        model.Items.Clear();
        baglanti_kur();
        komut.CommandText = "Select tel_model from t_telefon where tel_marka='" + marka.SelectedItem.ToString() + "'";
        rd = komut.ExecuteReader();
        while (rd.Read())
        {
            model.Items.Add(rd["tel_model"].ToString());
        }
        if (marka.SelectedItem.ToString() != "Seçiniz") {
            Model_Label.Visible = true;
            model.Visible = true;
        }      
    }
    protected void mus_id_cek() {
        baglanti_kur();
        komut.CommandText = "select mus_id from t_musteri where kul_ad='"+Session["kullanici"].ToString()+"'";
        rd = komut.ExecuteReader();
        if (rd.Read()) {
            Session["mus_id"]= rd["mus_id"].ToString();            
        }
        baglanti.Close();
    }
    protected void baglanti_kur()
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
    }
}