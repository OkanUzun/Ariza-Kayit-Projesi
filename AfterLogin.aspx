<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AfterLogin.aspx.cs" Inherits="AfterLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #TextArea1 {
        height: 86px;
        width: 235px;
    }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 40px;
        }
        .auto-style5 {
            height: 45px;
        }
        .auto-style6 {
            height: 43px;
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
            <td class="auto-style6" colspan="2">
                <asp:Label ID="baslik" runat="server" CssClass="baslik" Font-Bold="True" Text="Arıza Kayıt Formu" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label6" runat="server" CssClass="dikey_ortala" Font-Bold="True" Text="Marka :"></asp:Label>
                <asp:DropDownList ID="marka" runat="server" CssClass="dikey_ortala" AutoPostBack="True" OnSelectedIndexChanged="marka_SelectedIndexChanged">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                <asp:Label ID="Model_Label" runat="server" Font-Bold="True" Text="Model :" Visible="False"></asp:Label>
                <asp:DropDownList ID="model" runat="server" CssClass="dikey_ortala" Visible="False">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Açıklama"></asp:Label>
&nbsp;:</td>
            <td class="auto-style2">
                <asp:TextBox ID="Aciklama_TB" runat="server" CssClass="tb5" TextMode="MultiLine" Height="76px" Width="256px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Gonder" runat="server" Font-Bold="True" OnClick="Ariza_Kayit_Ekle" Text="Gönder" CssClass="myButton" />
            </td>
        </tr>
    </table>
</asp:Content>

