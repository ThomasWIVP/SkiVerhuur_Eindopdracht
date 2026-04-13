<%@ Page Title="" Language="C#" MasterPageFile="~/Public.master" AutoEventWireup="true" CodeBehind="Aanmelden.aspx.cs" Inherits="EindOpdracht6DAD.Aanmelden" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <div class="container">

        <h1 class="mb-3">Aanmelden</h1>
        <div>
                 <asp:Label ID="lblMessage" runat="server" CssClass="alert  d-block"></asp:Label>
        </div>
   
    
        <div  class="lblMessage">
            <p></p>
        </div>

        <div>
            <div class="mb-3">
                <div class="form-label">
                    Gebruikersnaam
                </div>
                <div>
                    <asp:TextBox CssClass="form-control" ID="a_txtGnaam" runat="server" OnTextChanged="a_txtGnaam_TextChanged"></asp:TextBox>

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

            <div class=" mb-3">
                <asp:Button ID="btnAanmelden" CssClass="btn btnAanmelden" runat="server" Text="Aanmelden" OnClick="btnAanmelden_Click" />
            </div>
        </div>
    </div>
</asp:Content>
