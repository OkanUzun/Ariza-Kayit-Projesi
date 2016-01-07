using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class BilgileriGuncelle : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    String mail, adres, tel;
    protected void Page_Load(object sender, EventArgs e)
    {
        mus_bilgi_cek();
        mail_TB.Text = mail;
        adres_TB.Text = adres;
        tel_TB.Text = tel;
    }
    protected void Guncelle_Buton(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "update t_musteri set mail='"+mail_TB.Text+"',adres='"+adres_TB.Text+"',cep_tel='"+tel_TB.Text+"' where kul_ad='"+Session["kullanici"].ToString()+"'";
        komut.ExecuteNonQuery();
        durum.Text = "Bilgiler güncellendi..";
        durum.Visible=true;   
        baglanti.Close();
    }
    protected void mus_bilgi_cek() {
        baglanti_kur();
        komut.CommandText = "select mail,adres,cep_tel from t_musteri where kul_ad='"+Session["kullanici"].ToString()+"'";
        rd = komut.ExecuteReader();
        if (rd.Read()) {
            mail = rd["mail"].ToString();
            adres = rd["adres"].ToString();
            tel = rd["cep_tel"].ToString();
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