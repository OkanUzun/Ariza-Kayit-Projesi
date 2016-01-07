<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaKayitlari.aspx.cs" Inherits="ArizaKayitlari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
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
    <table class="auto-style2">
        <tr>
            <td colspan="3">Arıza Kaydı Sayısı :
                <asp:Label ID="ariza_sayi" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Filtrele &gt;&gt;</td>
            <td>
                <asp:Label ID="marka_label" runat="server" Text="Marka : "></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="marka_filtre" runat="server" OnSelectedIndexChanged="marka_filtre_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem>Hepsi</asp:ListItem>
    </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="Ariza_Liste" runat="server" DataKeyNames="ARIZA_ID" EnableModelValidation="True" OnSelectedIndexChanged="Goruntule" Font-Bold="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Ariza Kaydinin Durumunu Görüntüle" ShowHeader="True" Text="Görüntüle" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
</asp:Content>

