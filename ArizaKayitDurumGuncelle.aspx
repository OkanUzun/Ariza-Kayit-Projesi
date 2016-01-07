<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaKayitDurumGuncelle.aspx.cs" Inherits="ArizaKayitDurumGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        width: 100%;
    }
    .auto-style5 {}
    .auto-style6 {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server">
    <Nodes>
        <asp:TreeNode Text="Müşterileri Görüntüle" Value="Müşterileri Görüntüle" NavigateUrl="~/MusteriKayitlari.aspx"></asp:TreeNode>
        <asp:TreeNode Text="Arıza Kayıtlarını Görüntüle" Value="Arıza Kayıtlarını Görüntüle" NavigateUrl="~/ArizaKayitlari.aspx"></asp:TreeNode>
    </Nodes>
</asp:TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="auto-style4">
    <tr>
        <td class="auto-style5" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Arıza Kaydının Durumunu Güncelle"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">Durum Seç </td>
        <td class="auto-style6">
            <asp:DropDownList ID="durum" runat="server">
                <asp:ListItem>Seçiniz</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">Detay Gir :</td>
        <td>
            <asp:TextBox ID="detay" runat="server" TextMode="MultiLine" CssClass="tb5"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">Ucret :</td>
        <td class="auto-style5">
            <asp:TextBox ID="ucret" runat="server" CssClass="tb5"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style5" colspan="2">
            <asp:Button ID="guncelle" runat="server" Text="Onayla" OnClick="guncelle_buton" CssClass="myButton" />
        </td>
    </tr>
</table>
</asp:Content>

