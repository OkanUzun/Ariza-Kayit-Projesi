﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArizaKayitDurumGoruntule.aspx.cs" Inherits="ArizaKayitDurumGoruntule" %>

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
    <asp:GridView ID="ariza_kayit_durum" runat="server" Font-Bold="True">
    </asp:GridView>
    <asp:Label ID="Toplam_Ucret" runat="server" Font-Bold="True" Text="Toplam Ucret :" Visible="False"></asp:Label>
    <asp:Label ID="Ucret" runat="server" Font-Bold="True" Visible="False"></asp:Label>
</asp:Content>

