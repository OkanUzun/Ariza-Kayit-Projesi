using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class ArizaKayitDurumGuncelle : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "select durum from t_olasi_durum";
        rd = komut.ExecuteReader();

        while (rd.Read()) {
            durum.Items.Add(rd["durum"].ToString());
        }
    }
    protected void guncelle_buton(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "insert into t_durum(durum,detay,ucret,ariza_id) values('" + durum.Text.ToString() + "','" + detay.Text.ToString() + "','" + int.Parse(ucret.Text.ToString()) + "','" + Session["admin_guncel_ariza_id"] + "')";
        komut.ExecuteNonQuery();
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