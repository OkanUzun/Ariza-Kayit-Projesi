<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Musteri_Ariza_Kayitlari.aspx.cs" Inherits="Musteri_Ariza_Kayitlari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <asp:GridView ID="MusArizaKayitlari" runat="server" DataKeyNames="ARIZA_ID" EnableModelValidation="True" OnSelectedIndexChanged="Goruntule" Font-Bold="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Arıza Kaydının Durumunu Görüntüle" ShowHeader="True" Text="Görüntüle" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Bilgilendirme" runat="server" Visible="False"></asp:Label>
</asp:Content>

