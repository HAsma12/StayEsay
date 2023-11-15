<%@ Page Title="" Language="C#" MasterPageFile="~/View/Administrateur/administrateurMaster.Master" AutoEventWireup="true" CodeBehind="gererservicerestaurants.aspx.cs" Inherits="StayEsay.View.Administrateur.gererservicerestaurants" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Medula+One" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <h2 style="color: #ecabb5; text-align: center; font-family: 'Medula One', cursive;">Liste complète des restaurants</h2>

    <asp:GridView ID="GridViewRestaurant" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-left: auto; margin-right: auto;">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Idrestaurant" HeaderText="ID" />
            <asp:BoundField DataField="nom" HeaderText="Nom" />

            <asp:TemplateField HeaderText="img1">
                <ItemTemplate>
                    <asp:Image ID="img1" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp1")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="img2">
                <ItemTemplate>
                    <asp:Image ID="img2" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp2")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="img3">
                <ItemTemplate>
                    <asp:Image ID="img3" runat="server" Height="50px" Width="50px" ImageUrl='<%# GetImageUrl(Eval("imgsupp3")) %>' />
                </ItemTemplate>
            </asp:TemplateField>



            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlActions" runat="server">

                        <asp:ListItem Text="Accepter" Value="Accepter"></asp:ListItem>
                        <asp:ListItem Text="Refuser" Value="Refuser"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnModifier" runat="server" Text="Modifier" CommandName="Modifier" CommandArgument='<%# Eval("Idrestaurant") %>' OnCommand="btnAction_Command" />
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>
