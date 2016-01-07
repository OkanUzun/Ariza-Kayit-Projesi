<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaListe.aspx.cs" Inherits="ArızaListe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TreeView ID="TreeView1" runat="server">
    <Nodes>
        <asp:TreeNode Text="Kişisel Bilgilerim" Value="Kişisel Bilgilerim" NavigateUrl="~/BilgileriGuncelle.aspx">
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
    <asp:GridView ID="mus_ariza" runat="server" DataKeyNames="ARIZA_ID" EnableModelValidation="True" OnRowDeleting="mus_ariza_RowDeleting" OnRowEditing="mus_ariza_RowEditing" OnSelectedIndexChanged="goruntule">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" DeleteText="Sil" HeaderText="Kaydı Sil" >
            <ControlStyle CssClass="myButton" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" EditText="Güncelle" SelectText="Görüntüle" HeaderText="Kaydı Güncelle" >
            <ControlStyle CssClass="myButton" />
            </asp:CommandField>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Görüntüle" HeaderText="Kayıt Durumu" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Bilgilendirme" runat="server" Font-Bold="True" Visible="False"></asp:Label>
    </asp:Content>

