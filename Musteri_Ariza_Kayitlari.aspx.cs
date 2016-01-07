using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class Musteri_Ariza_Kayitlari : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd1, rd2;
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
        komut.CommandText = "select ariza_id,tel_marka,tel_model,tel_aciklama from t_ariza_kayit where mus_id='"+Convert.ToInt32(Session["mus_id"])+"' order by ariza_id";
        rd1 = komut.ExecuteReader();
        rd2 = komut.ExecuteReader();
        if (rd1.Read())
        {
            MusArizaKayitlari.DataSource = rd2;
            MusArizaKayitlari.DataBind();
        }
        else { 
            Bilgilendirme.Text = "Kullanıcıya ait herhangi bir arıza kaydı bulunamadı..";
            Bilgilendirme.Visible = true;
        }
        baglanti.Close();
            
    }
    protected void Goruntule(object sender, EventArgs e)
    {
        Session["ariza_id"] = MusArizaKayitlari.DataKeys[MusArizaKayitlari.SelectedIndex].Values["ARIZA_ID"].ToString();
        Page.Response.Redirect("ArizaKayitDurumGecmisi.aspx");
    }
}