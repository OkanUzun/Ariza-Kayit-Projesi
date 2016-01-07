using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI; 
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class Anasayfa : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    
    protected void Giris_Buton(object sender, EventArgs e)
    {
        if (Kul_TB.Text == "Admin" && Sifre_TB.Text == "Password") {
            Page.Response.Redirect("MusteriKayitlari.aspx");
            
        }
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
        komut.CommandText = "select * from t_musteri where kul_ad='" + Kul_TB.Text + "' and sifre='" + Sifre_TB.Text + "'";
        rd = komut.ExecuteReader();

        if (rd.Read())
        {            
            Session.Add("kullanici", Kul_TB.Text);
            Page.Response.Redirect("AfterLogin.aspx");
        }
        else { 
            Durum_Label.Text = "Giriş Başarısız..";
            Durum_Label.Visible = true;

        }
            
    }
    protected void Kayit_Buton(object sender, EventArgs e)
    {
        Page.Response.Redirect("KayitOl.aspx");
    }
}