<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MusteriKayitlari.aspx.cs" Inherits="MusteriKayitlari" %>

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
    <asp:Label ID="bilgi_label" runat="server" Text="Sistemdeki Tüm Müşteriler" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;--<asp:Label ID="mus_sayisi" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;<asp:GridView ID="Musteri_Liste" runat="server" DataKeyNames="MUS_ID" EnableModelValidation="True" OnSelectedIndexChanged="Goruntule" Font-Bold="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Müşterinin Verdiği Arıza Kayıtlarını Görüntüle" ShowHeader="True" Text="Görüntüle" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
</asp:Content>

