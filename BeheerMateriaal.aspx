<%@ Page Title="" Language="C#" MasterPageFile="~/Private.master" AutoEventWireup="true" CodeBehind="BeheerMateriaal.aspx.cs" Inherits="EindOpdracht6DAD.BeheerMateriaal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">



    <div class="container">

        <h1>Beheer Materialen</h1>
        
        <div class="mb-4 mt-4">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert  d-block"></asp:Label>
        </div>
        <div>
            <asp:Label CssClass="form-label" ID="lbMateriaalType" runat="server" Text="Selecteer een materiaaltype"></asp:Label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="dllMateriaalTypen" runat="server"   OnSelectedIndexChanged="FilterMaterialen"></asp:DropDownList>


            <asp:Label CssClass="form-label" ID="lblMerk" runat="server" Text="Selecteer een merk"></asp:Label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="ddlmerken" runat="server"   OnSelectedIndexChanged="FilterMaterialen"></asp:DropDownList>


            <asp:Label CssClass="form-label" ID="lblMateriaal" runat="server" Text="Selecteer een materiaal"></asp:Label>
            <asp:DropDownList  AutoPostBack="true" CssClass="form-control" ID="dllMaterialen" runat="server" OnSelectedIndexChanged="dllMaterialen_SelectedIndexChanged"></asp:DropDownList>

            <asp:Label CssClass="form-label" ID="lblModel" runat="server" Text="Model:"></asp:Label>
            <asp:TextBox CssClass="form-control mb-3" ID="txtModel" runat="server"></asp:TextBox>



        </div>


        <div class="row">


            <div class="col-sm-6">

                <asp:Label CssClass="form-label" ID="lblFoto" runat="server" Text="Foto:"></asp:Label>
               <asp:FileUpload  CssClass="form-control mb-3" ID="fuFoto" runat="server" />
                <asp:Button CssClass="bm-btn btn 
                    " ID="btnFoto" runat="server" Text="Foto Bewaren" OnClick="btnFoto_Click" />
            </div>


            <div class="col-sm-6">
                
                  <asp:Image ImageUrl="~/Images/no-image-available.png" ID="imgFoto" runat="server" />
            </div>
        </div>

            <div class="row mb-3">
        <div class="col-sm-4">
            <asp:Button CssClass="bm-btn btn  w-100" ID="btnNieuw" runat="server" Text="Nieuw" OnClick="btnNieuw_Click" />
        </div>
        <div class="col-sm-4">
            <asp:Button CssClass="bm-btn btn  w-100" ID="btnBewaren" runat="server" Text="Bewaren" OnClick="btnBewaren_Click"  />
        </div>
        <div class="col-sm-4">
            <asp:Button CssClass="bm-btn btn  w-100" ID="btnVerwijderen" runat="server" Text="Verwijderen" OnClick="btnVerwijderen_Click"  />
        </div>
    </div>

    </div>
</asp:Content>
