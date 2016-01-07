<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KayitOl.aspx.cs" Inherits="KayitOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4" class="auto-style2">
                <asp:Label ID="Label1" runat="server" CssClass="baslik" Font-Bold="True" Text="Üye Kayıt Formu"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Kul_Ad" runat="server" Font-Bold="True" Text="Kullanıcı Adı :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Kullanici_TB" runat="server" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Kullanici_TB" ErrorMessage="Kullanıcı Adı Boş Bırakılamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Doğum Tarihi :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="dogum_tarih_TB" runat="server" TabIndex="4" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dogum_tarih_TB" ErrorMessage="Dogum Tarihi Bos Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Sifre" runat="server" Font-Bold="True" Text="Şifre :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Sifre_TB" runat="server" TextMode="Password" TabIndex="1" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Sifre_TB" ErrorMessage="Sifre Bos Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Mail :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="mail_TB" runat="server" TabIndex="5" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="mail_TB" ErrorMessage="Mail Bos Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mail_TB" ErrorMessage="Geçerli Bir Mail Giriniz." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="kayit">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Sifre_Onay" runat="server" Font-Bold="True" Text="Şifre Onay :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Sifre_Onay_TB" runat="server" TextMode="Password" TabIndex="2" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Sifre_Onay_TB" ErrorMessage="Sifre Onay Bos Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Tel :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tel_TB" runat="server" TabIndex="6" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tel_TB" ErrorMessage="Telefon Numarasi Bos Birakilamaz" ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Ad :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Ad_TB" runat="server" TabIndex="3" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Ad_TB" ErrorMessage="İsim Boş Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Adres :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="adres_TB" runat="server" TextMode="MultiLine" TabIndex="7" Height="30px" Width="193px" CssClass="tb5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="adres_TB" ErrorMessage="Adres Kısmı Boş Birakilamaz." ValidationGroup="kayit">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="kayit" />
            </td>
            <td>
                <asp:Button ID="Kayit_Buton" runat="server" Font-Bold="True" OnClick="Kayit_Ol" Text="Gönder" ValidationGroup="kayit" CssClass="myButton" />
            </td>
        </tr>
    </table>
</asp:Content>

