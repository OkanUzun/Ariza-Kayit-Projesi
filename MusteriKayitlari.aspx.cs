using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class MusteriKayitlari : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
        komut.CommandText = "select mus_id,kul_ad,isim,dogum_tarih,adres,mail,cep_tel,kayit_tarih from t_musteri order by mus_id";
        rd = komut.ExecuteReader();
        Musteri_Liste.DataSource = rd;
        Musteri_Liste.DataBind();
        baglanti.Close();
        mus_sayisi.Text = " Müşteri Sayısı : "+Musteri_Liste.Rows.Count.ToString();
    }
    protected void Goruntule(object sender, EventArgs e)
    {
        Session["mus_id"] = Musteri_Liste.DataKeys[Musteri_Liste.SelectedIndex].Values["MUS_ID"].ToString();
        Page.Response.Redirect("Musteri_Ariza_Kayitlari.aspx");
    }
}