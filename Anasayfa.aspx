<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Anasayfa.aspx.cs" Inherits="Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/htc-one-ifixit-degerlendirmesi.jpg" Height="314px" Width="531px" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="MainTable" >
        <tr>
            <td colspan="3" class="auto-style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Kullanıcı Girişi" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Kullanıcı Adı :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="Kul_TB" runat="server" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Kul_TB" ErrorMessage="Kullanıcı Adı Boş Bırakılamaz" ValidationGroup="must"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Şifre :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="Sifre_TB" runat="server" CssClass="tb5" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Sifre_TB" ErrorMessage="Şifre Boş Bırakılamaz." ValidationGroup="must"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3">
                <asp:Button ID="Giris_Yap" runat="server" Font-Bold="True" Text="Giriş Yap" OnClick="Giris_Buton" CssClass="myButton" />
                <asp:Button ID="Kayit_Ol" runat="server" Font-Bold="True" Text="Kayıt Ol" OnClick="Kayit_Buton" CssClass="myButton" />
            </td>
            <td class="auto-style3">
                <asp:Label ID="Durum_Label" runat="server" Font-Bold="True" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
        .auto-style2 {
            height: 50px;
        }
        .auto-style3 {
            height: 89px;
        }
    </style>
</asp:Content>


