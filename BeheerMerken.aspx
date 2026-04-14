<%@ Page Title="" Language="C#" MasterPageFile="~/Private.master" AutoEventWireup="true" CodeBehind="BeheerMerken.aspx.cs" Inherits="EindOpdracht6DAD.BeheerMerken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">


    <div class="container">

        <h1 >Beheer Merken</h1>

        <div class="mb-4 mt-4">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert  d-block"></asp:Label>
        </div>

        <div class="mb-3">
            <div class="form-label">
                Selecteer een merk:
            </div>
            <div>

                <asp:DropDownList CssClass="form-control" ID="ddlMerk" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMerk_SelectedIndexChanged"></asp:DropDownList>
            </div>


            <div class="mb-3">



                <div class="form-label">
                    Naam
                </div>
                <div>
                    <%--   kijk   nog is naar hoe autopostback werkt--%>
                    <asp:TextBox CssClass="form-control" AutoPostBack="true" ID="txtNaam" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
            </div>

        </div>



        <div class="row mb-3">
            <div class="col-sm-4">
                <asp:Button CssClass="bm-btn btn  w-100" ID="btnNieuw" runat="server" Text="Nieuw" OnClick="btnNieuw_Click" />
            </div>
            <div class="col-sm-4">
                <asp:Button CssClass="bm-btn btn  w-100" ID="btnBewaren" runat="server" Text="Bewaren" OnClick="btnBewaren_Click" />
            </div>
            <div class="col-sm-4">
                <asp:Button CssClass="bm-btn btn  w-100" ID="btnVerwijderen" runat="server" Text="Verwijderen" OnClick="btnVerwijderen_Click" />
            </div>
        </div>





    </div>






</asp:Content>
