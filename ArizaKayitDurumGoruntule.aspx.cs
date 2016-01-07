using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class ArizaKayitDurumGoruntule : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    int toplam = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
        komut.CommandText = "select durum,detay,ucret,durum_tarih from t_durum where ariza_id='"+Convert.ToInt32(Session["ariza_id"])+"' order by durum_id";
        rd = komut.ExecuteReader();   
        ariza_kayit_durum.DataSource = rd;
        ariza_kayit_durum.DataBind();
        rd = komut.ExecuteReader();
        while (rd.Read())
        {
            toplam += int.Parse(rd["ucret"].ToString());
        }
        
        if (toplam != 0) {
            Ucret.Text = toplam.ToString() + " TL";
            Toplam_Ucret.Visible = true;
            Ucret.Visible = true;
        }
        baglanti.Close();
    }
}