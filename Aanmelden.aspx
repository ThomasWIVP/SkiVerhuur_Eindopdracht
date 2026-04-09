<%@ Page Title="" Language="C#" MasterPageFile="~/Public.master" AutoEventWireup="true" CodeBehind="Aanmelden.aspx.cs" Inherits="EindOpdracht6DAD.Aanmelden" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <div class="container">

        <h1>Aanmelden</h1>

        <div>
            <div class="mb-3">
                <div class="form-label">
                    Gebruikersnaame
                </div>
                <div>
                    <asp:TextBox CssClass="form-control" ID="a_txtGnaam" runat="server"></asp:TextBox>

                </div>


                <div class="mb-3">



                    <div class="form-label">
                        Wachtwoord
                    </div>
                    <div>
                        <asp:TextBox CssClass="form-control" ID="a_txtWachtwoord" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

            </div>

            <div class="btn btnAanmelden mb-3">
                <a>Aanmelden</a>
            </div>
        </div>
    </div>
</asp:Content>
