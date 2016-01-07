using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class ArizaKayitDurumGecmisi : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        grid_yenile();
        if (olasi_durum.Items.Count == 1)
        {
            baglanti_kur();
            komut.CommandText = "select durum from t_olasi_durum";
            rd = komut.ExecuteReader();

            while (rd.Read())
            {
                olasi_durum.Items.Add(rd["durum"].ToString());
            }
            baglanti.Close();
        }
    }
    protected void Durum_Gir_Click(object sender, EventArgs e)
    {
        durum_label.Visible = true;
        detay_label.Visible = true;
        ucret_label.Visible = true;
        olasi_durum.Visible = true;
        detay_TB.Visible = true;
        ucret_TB.Visible = true;
        guncelle.Visible = true;
        duzenle.Visible = false;
    }
    protected void guncelle_buton(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "insert into t_durum(ariza_id,durum,detay,ucret) values('"+Session["ariza_id"]+"','"+olasi_durum.SelectedItem.ToString()+"','"+detay_TB.Text+"','"+int.Parse(ucret_TB.Text)+"')";
        komut.ExecuteNonQuery();
        baglanti.Close();
        grid_yenile();        
    }
    protected void grid_yenile() {
        baglanti_kur();
        komut.CommandText = "select durum_id,durum,detay,ucret,durum_tarih from t_durum where ariza_id='" + Session["ariza_id"] + "' order by durum_id";
        rd = komut.ExecuteReader();
        durum_gecmis.DataSource = rd;
        durum_gecmis.DataBind();
        Durum_Gir.Visible = true;
    }
    protected void durum_gecmis_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (durum_gecmis.DataKeys[e.RowIndex].Values["DURUM"].ToString() == "Onay Bekliyor")
            Bilgilendirme.Text = "Başlangıç durumu silinemez..";
        else { 
            Session["durum_id"] = Convert.ToInt32(durum_gecmis.DataKeys[e.RowIndex].Values["DURUM_ID"].ToString());
            baglanti_kur();
            komut.CommandText = "delete from t_durum where durum_id='" + Session["durum_id"] + "'";
            komut.ExecuteNonQuery();
            baglanti.Close();
            grid_yenile();  
        }               
    }
    protected void durum_gecmis_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (durum_gecmis.DataKeys[e.NewEditIndex].Values["DURUM"].ToString() == "Onay Bekliyor")
            Bilgilendirme.Text = "Başlangıç durumu düzenlenemez..";
        else {
            detay_TB.Text = durum_gecmis.DataKeys[e.NewEditIndex].Values["DETAY"].ToString();
            olasi_durum.SelectedItem.Text = durum_gecmis.DataKeys[e.NewEditIndex].Values["DURUM"].ToString();
            ucret_TB.Text = durum_gecmis.DataKeys[e.NewEditIndex].Values["UCRET"].ToString();
            durum_label.Visible = true;
            detay_label.Visible = true;
            ucret_label.Visible = true;
            olasi_durum.Visible = true;
            detay_TB.Visible = true;
            ucret_TB.Visible = true;
            guncelle.Visible = false;
            duzenle.Visible = true;

            Session.Add("durum_id", int.Parse(durum_gecmis.DataKeys[e.NewEditIndex].Values["DURUM_ID"].ToString()));        
        }        
    }
    protected void duzenle_buton(object sender, EventArgs e)
    {
        baglanti_kur();
        komut.CommandText = "update t_durum set durum='" + olasi_durum.SelectedItem.ToString() + "',detay='" + detay_TB.Text + "',ucret ='" + ucret_TB.Text + "' where durum_id='" + Session["durum_id"] + "'";
        komut.ExecuteNonQuery();
        baglanti.Close();
        grid_yenile();
    }
    protected void baglanti_kur()
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
    }
}