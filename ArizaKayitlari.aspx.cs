using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class ArizaKayitlari : System.Web.UI.Page
{
    String constring = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcl)));User Id=hr;Password=oracle;";
    OracleConnection baglanti;
    OracleCommand komut;
    OracleDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        gridview_yenile();
        if (marka_filtre.Items.Count == 1) {
            baglanti_kur();
            komut.CommandText = "select distinct tel_marka from t_telefon";
            rd = komut.ExecuteReader();
            while (rd.Read())
            {
                marka_filtre.Items.Add(rd["tel_marka"].ToString());
            }
            baglanti.Close();
        }        
    }
    /*protected void Ariza_Liste_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session.Add("admin_guncel_ariza_id", int.Parse(Ariza_Liste.DataKeys[e.NewEditIndex].Values["ARIZA_ID"].ToString()));
        Page.Response.Redirect("ArizaKayitDurumGuncelle.aspx");
    }*/
    protected void Goruntule(object sender, EventArgs e)
    {
        Session["ariza_id"] = Ariza_Liste.DataKeys[Ariza_Liste.SelectedIndex].Values["ARIZA_ID"].ToString();
        Page.Response.Redirect("ArizaKayitDurumGecmisi.aspx");
    }
    protected void marka_filtre_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridview_yenile();
    }
    protected void gridview_yenile() {
        if (marka_filtre.SelectedItem.ToString() == "Hepsi")
        {
            baglanti_kur();
            komut.CommandText = "select ariza_id,tel_marka,tel_model,tel_aciklama from t_ariza_kayit order by ariza_id";
            rd = komut.ExecuteReader();
            Ariza_Liste.DataSource = rd;
            Ariza_Liste.DataBind();
            baglanti.Close();
        }
        else {
            baglanti_kur();
            komut.CommandText = "select ariza_id,tel_marka,tel_model,tel_aciklama from t_ariza_kayit where tel_marka='"+marka_filtre.SelectedItem.ToString()+"' order by ariza_id";
            rd = komut.ExecuteReader();
            Ariza_Liste.DataSource = rd;
            Ariza_Liste.DataBind();
            baglanti.Close();
        }
        ariza_sayi.Text = Ariza_Liste.Rows.Count.ToString();       
    }
    protected void baglanti_kur()
    {
        baglanti = new OracleConnection(constring);
        baglanti.Open();
        komut = new OracleCommand();
        komut.Connection = baglanti;
    }
}