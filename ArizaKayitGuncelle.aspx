<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaKayitGuncelle.aspx.cs" Inherits="ArizaKayitGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style8 {
        height: 41px;
    }
    .auto-style9 {
        height: 33px;
    }
    .auto-style5 {
        width: 71px;
        height: 33px;
    }
    .auto-style7 {
        height: 90px;
    }
    #TextArea1 {
        height: 86px;
        width: 195px;
    }
    .auto-style10 {
        height: 39px;
    }
    .auto-style4 {
        width: 91%;
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
    <table class="auto-style4">
    <tr>
        <td class="auto-style8" colspan="4">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Arıza Kaydı Güncelle"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style9">
            <asp:Label ID="marka_label" runat="server" Text="Marka :"></asp:Label>
        </td>
        <td class="auto-style9">
            <asp:DropDownList ID="marka" runat="server" OnSelectedIndexChanged="marka_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>Seçiniz</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style5">
            <asp:Label ID="model_label" runat="server" Text="Model :" Visible="False"></asp:Label>
        </td>
        <td class="auto-style5">
            <asp:DropDownList ID="model" runat="server" Visible="False">
                <asp:ListItem>Seçiniz</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">
            <asp:Label ID="Label3" runat="server" Text="Açıklama :"></asp:Label>
        </td>
        <td class="auto-style7" colspan="3">
            <asp:TextBox ID="aciklama_TB" runat="server" TextMode="MultiLine" CssClass="tb5"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="4">
            <asp:Button ID="Guncelle" runat="server" Text="Güncelle" Width="84px" OnClick="Guncelle_Buton" CssClass="myButton" />
        </td>
    </tr>
</table>
</asp:Content>

