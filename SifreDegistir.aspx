<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SifreDegistir.aspx.cs" Inherits="SifreDegistir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        width: 100%;
    }
    .auto-style5 {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server">
        <Nodes>
            <asp:TreeNode Text="Kişisel Bilgilerim" Value="Kişisel Bilgilerim" NavigateUrl="~/SifreDegistir.aspx">
                <asp:TreeNode Text="Şifre Değiştir" Value="Şifre Değiştir" NavigateUrl="~/SifreDegistir.aspx"></asp:TreeNode>
                <asp:TreeNode Text="Bilgilerimi Güncelle" Value="Bilgilerimi Güncelle" NavigateUrl="~/BilgileriGuncelle.aspx"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Arıza Kaydı" Value="Arıza Kaydı">
                <asp:TreeNode Text="Arıza Kaydı Oluştur" Value="Arıza Kaydı Oluştur" NavigateUrl="~/AfterLogin.aspx"></asp:TreeNode>
                <asp:TreeNode Text="Arıza Kaydını Görüntüle" Value="Arıza Kaydını Görüntüle" NavigateUrl="~/ArizaListe.aspx"></asp:TreeNode>
            </asp:TreeNode>
        </Nodes>
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="auto-style4">
    <tr>
        <td class="auto-style5" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Şifre Değiştir" CssClass="baslik"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Eski Şifre" Font-Bold="True"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="eski_sifre_TB" runat="server" Width="200px" CssClass="tb5" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Yeni Şifre" Font-Bold="True"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="yeni_sifre_TB" runat="server" Width="200px" CssClass="tb5" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Yeni Şifre Onay" Font-Bold="True"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="yeni_sifre_onay_TB" runat="server" Width="200px" CssClass="tb5" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Onayla" runat="server" Text="Onayla" Width="92px" Font-Bold="True" OnClick="Sifre_Degistir" CssClass="myButton" />
        </td>
        <td>
            <asp:Label ID="durum" runat="server" Font-Bold="True" Visible="False"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

