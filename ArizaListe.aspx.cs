using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;

public partial class ArızaListe : System.Web.UI.Page
{
    String durum;
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd1,rd2;
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "select ariza_id,tel_marka,tel_model,tel_aciklama,ariza_tarih from t_ariza_kayit where mus_id='" + Convert.ToInt32(Session["mus_id"]) + "' order by ariza_id";
        /*rd = komut.ExecuteReader();
        mus_ariza.DataSource = rd;
        mus_ariza.DataBind();        
        baglanti.Close(); */
        rd1 = komut.ExecuteReader();
        rd2 = komut.ExecuteReader();
        if (rd1.Read())
        {
            mus_ariza.DataSource = rd2;
            mus_ariza.DataBind();
        }
        else
        {
            Bilgilendirme.Text = "Herhangi bir arıza kaydınız bulunmamaktadır..";
            Bilgilendirme.Visible = true;
        }
        baglanti.Close();
    }
    protected void mus_ariza_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Session["ariza_id"] = Convert.ToInt32(mus_ariza.DataKeys[e.RowIndex].Values["ARIZA_ID"].ToString());
        ariza_durum_cek();
        if (durum == "Onay Bekliyor")
        {
            baglanti_kur();
            komut.CommandText = "delete from t_ariza_kayit where ariza_id='" + Convert.ToInt32(Session["ariza_id"]) + "'";
            komut.ExecuteNonQuery();
            baglanti.Close();
            Page.Response.Redirect("ArizaListe.aspx");
        }
        else {
            Bilgilendirme.Text = "Arizaniz onaylandigindan silinemedi..";
            Bilgilendirme.Visible = true;
        }                               
    }

    protected void mus_ariza_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session.Add("ariza_id", int.Parse(mus_ariza.DataKeys[e.NewEditIndex].Values["ARIZA_ID"].ToString()));
        ariza_durum_cek();
        if (durum == "Onay Bekliyor")
        {
            Page.Response.Redirect("ArizaKayitGuncelle.aspx");
        }
        else { 
            Bilgilendirme.Text = "Arizaniz onaylandigindan guncelleme islemi yapilamaz..";
            Bilgilendirme.Visible = true;
        }
            
        
    }
    protected void goruntule(object sender, EventArgs e)
    {
        Session["ariza_id"]=mus_ariza.DataKeys[mus_ariza.SelectedIndex].Values["ARIZA_ID"].ToString();
        Page.Response.Redirect("ArizaKayitDurumGoruntule.aspx");
    }
    protected void ariza_durum_cek() {
        baglanti_kur();
        komut.CommandText = "select durum from t_durum where ariza_id='"+Session["ariza_id"]+"'";
        rd1=komut.ExecuteReader();
        while (rd1.Read()) {
            durum = rd1["durum"].ToString();
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