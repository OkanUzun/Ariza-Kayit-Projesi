using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class SifreDegistir : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    String sifre;
    protected void Page_Load(object sender, EventArgs e)
    {
        mus_sifre_cek();
    }
    protected void Sifre_Degistir(object sender, EventArgs e)
    {
        if (eski_sifre_TB.Text == sifre && yeni_sifre_TB.Text == yeni_sifre_onay_TB.Text)
        {
            baglanti_kur();
            komut.CommandText = "update t_musteri set sifre='" + yeni_sifre_TB.Text + "' where kul_ad='" + Session["kullanici"].ToString() + "' ";
            komut.ExecuteNonQuery();

            baglanti.Close();
            baglanti.Dispose();
            durum.Text = "Şifre Değiştirildi";
        }
        else
            durum.Text = "Şifre Değiştirme İşlemi Başarısız..";
        durum.Visible = true;              
    }
    protected void mus_sifre_cek() {
        baglanti_kur();
        komut.CommandText = "select sifre from t_musteri where kul_ad='"+Session["kullanici"].ToString()+"'";
        rd = komut.ExecuteReader();
        if (rd.Read())
            sifre = rd["sifre"].ToString();
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