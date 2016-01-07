using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class KayitOl : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Kayit_Ol(object sender, EventArgs e)
    {
        if (Sifre_TB.Text == Sifre_Onay_TB.Text)
        {
            baglanti = new OracleConnection(constring);
            baglanti.Open();
            komut = new OracleCommand();
            komut.Connection = baglanti;
            komut.CommandText = "insert into t_musteri(KUL_AD,SIFRE,ISIM,DOGUM_TARIH,ADRES,MAIL,CEP_TEL) values('" + Kullanici_TB.Text.ToString() + "','" + Sifre_TB.Text.ToString() + "','" + Ad_TB.Text.ToString() + "','" + dogum_tarih_TB.Text.ToString() + "','" + adres_TB.Text.ToString() + "','" + mail_TB.Text.ToString() + "','" + tel_TB.Text.ToString() + "')";

            komut.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("Anasayfa.aspx");
        }
    }
}