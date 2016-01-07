<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaKayitDurumGecmisi.aspx.cs" Inherits="ArizaKayitDurumGecmisi" %>

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
    <asp:Label ID="Baslik" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Arıza Kaydının İşlem Geçmişi"></asp:Label>
    <asp:GridView ID="durum_gecmis" runat="server" DataKeyNames="DURUM_ID,DURUM,DETAY,UCRET" EnableModelValidation="True" OnRowDeleting="durum_gecmis_RowDeleting" OnRowEditing="durum_gecmis_RowEditing" Font-Bold="True">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Arıza Kaydının Durumunu Sil" ShowHeader="True" Text="Sil" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
            <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="Arıza Kaydının Durumunu Düzenle" ShowHeader="True" Text="Düzenle" >
            <ControlStyle CssClass="myButton" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <table class="auto-style2">
        <tr>
            <td colspan="2">
                <asp:Button ID="Durum_Gir" runat="server" OnClick="Durum_Gir_Click" Text="Yeni Durum Gir" Visible="False" CssClass="myButton" />
                <asp:Label ID="Bilgilendirme" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="durum_label" runat="server" Text="Durum :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="olasi_durum" runat="server" Visible="False">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="detay_label" runat="server" Text="Detay :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="detay_TB" runat="server" TextMode="MultiLine" Visible="False" CssClass="tb5" Height="47px" Width="230px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="ucret_label" runat="server" Text="Ucret :" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ucret_TB" runat="server" Visible="False" CssClass="tb5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="guncelle" runat="server" OnClick="guncelle_buton" Text="Onayla" Visible="False" CssClass="myButton" />
            </td>
            <td>
                <asp:Button ID="duzenle" runat="server" OnClick="duzenle_buton" Text="Onayla" Visible="False" CssClass="myButton" />
            </td>
        </tr>
    </table>
</asp:Content>

