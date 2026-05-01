<%@ Page Title="" Language="C#" MasterPageFile="~/Private.master" AutoEventWireup="true" CodeBehind="BeheerMaten.aspx.cs" Inherits="EindOpdracht6DAD.BeheerMaten" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <div class="container">
        <h1>Beheer Maten.</h1>


        <div>
            <%--    materiaal type--%>
            <asp:Label CssClass="form-label" ID="lbMateriaalType" runat="server" Text="Selecteer een materiaaltype"></asp:Label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="dllMateriaalTypen" runat="server"></asp:DropDownList>

            <%--   merk--%>
            <asp:Label CssClass="form-label" ID="lblMerk" runat="server" Text="Selecteer een merk"></asp:Label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="ddlmerken" runat="server"></asp:DropDownList>

            <%--    materiaal--%>
            <asp:Label CssClass="form-label" ID="lblMateriaal" runat="server" Text="Selecteer een materiaal"></asp:Label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="dllMaterialen" runat="server"></asp:DropDownList>

            <hr />


            <div class="mb-3">
                <%-- maat--%>
                <asp:Label CssClass="form-label" ID="lblMaten" runat="server" Text="Selecteer een maat"></asp:Label>

            </div>


            <%--     aantal--%>

            <div class="mb-3">
                <asp:Label CssClass="form-label" ID="lblAantal" runat="server" Text="Aantal"></asp:Label>
                <asp:TextBox CssClass="form-control mb-3" ID="txtAantal" runat="server"></asp:TextBox>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <asp:Button CssClass="bm-btn btn  w-100" ID="btnToevoegenA" runat="server" Text="Maat toevoegen aan artikel" />
                    </div>
                    <div class="col-sm-4">
                        <asp:Button CssClass="bm-btn btn  w-100" ID="btnUpdatenA" runat="server" Text="Aantal van maat updaten"  Enabled="False" />
                    </div>
                    <div class="col-sm-4">
                        <asp:Button CssClass="bm-btn btn  w-100" ID="btnVerwijderenA" runat="server" Text="Maat verwijderen van materiaal" Enabled="False" />
                    </div>
                </div>
            </div>


            <hr "/>

            <div class="mb-3">
                <asp:Label CssClass="form-label" ID="lblMaat" runat="server" Text="Selecteer een maat"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtMaat" runat="server"></asp:TextBox>
            </div>



            <div class="mb-3">
                <asp:Label CssClass="form-label" ID="lblNaam" runat="server" Text="Naam:"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="txtNaam" runat="server"></asp:TextBox>
            </div>



            <div class="row mb-3">
                <div class="col-sm-4">
                    <asp:Button CssClass="bm-btn btn  w-100" ID="btnNieuw" runat="server" Text="Nieuw"  />
                </div>
                <div class="col-sm-4">
                    <asp:Button CssClass="bm-btn btn  w-100" ID="btnBewaren" runat="server" Text="Bewaren" />
                </div>
                <div class="col-sm-4">
                    <asp:Button CssClass="bm-btn btn  w-100" ID="btnVerwijderen" runat="server" Text="Verwijderen" />
                </div>
            </div>




        </div>
    </div>



</asp:Content>
