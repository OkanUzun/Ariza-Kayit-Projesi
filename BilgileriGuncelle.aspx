<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BilgileriGuncelle.aspx.cs" Inherits="BilgileriGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 47px;
        }
        .auto-style4 {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server">
    <Nodes>
        <asp:TreeNode Text="Kişisel Bilgilerim" Value="Kişisel Bilgilerim">
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
    <table class="auto-style1">
        <tr>
            <td colspan="2" class="auto-style3">
                <asp:Label ID="Label1" runat="server" CssClass="baslik" Font-Bold="True" Text="Bilgileri Güncelle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Mail :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="mail_TB" runat="server" CssClass="tb5"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mail_TB" ErrorMessage="Geçerli Bir Mail Giriniz." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="guncelle">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Cep Telefonu :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tel_TB" runat="server" CssClass="tb5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Adres :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="adres_TB" runat="server" CssClass="tb5" TextMode="MultiLine" Height="55px" Width="196px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="guncelle" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="Guncelle" runat="server" Font-Bold="True" Text="Onayla" OnClick="Guncelle_Buton" ValidationGroup="guncelle" CssClass="myButton" />
                <asp:Label ID="durum" runat="server" Font-Bold="True" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

