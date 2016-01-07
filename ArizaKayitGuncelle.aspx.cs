using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class ArizaKayitGuncelle : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (marka.Items.Count==1)
        {
            baglanti_kur();
            komut.CommandText = "select distinct tel_marka from t_telefon";
            rd = komut.ExecuteReader();
            while (rd.Read())
                marka.Items.Add(rd["tel_marka"].ToString());
            baglanti.Close();
        }
    }

    protected void Guncelle_Buton(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "update t_ariza_kayit set tel_marka='" + marka.SelectedItem.ToString() + "' ,tel_model='" + model.SelectedItem.ToString() + "', tel_aciklama='" + aciklama_TB.Text.ToString() + "' WHERE ariza_id='" + Convert.ToInt32(Session["ariza_id"]) + "'";
        komut.ExecuteNonQuery();
        baglanti.Close();
        Page.Response.Redirect("ArizaListe.aspx");
    }
    protected void marka_SelectedIndexChanged(object sender, EventArgs e)
    {
        model.Items.Clear();
        model.Items.Add("Seçiniz");
        baglanti_kur();
        komut.CommandText = "select tel_model from t_telefon where tel_marka='"+marka.SelectedItem.ToString()+"'";
        rd = komut.ExecuteReader();
        while (rd.Read()) {
            model.Items.Add(rd["tel_model"].ToString());
        }
        if (marka.SelectedItem.ToString() != "Seçiniz") {
            model.Visible = true;
            model_label.Visible = true;
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