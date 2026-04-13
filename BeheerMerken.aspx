<%@ Page Title="" Language="C#" MasterPageFile="~/Private.master" AutoEventWireup="true" CodeBehind="BeheerMerken.aspx.cs" Inherits="EindOpdracht6DAD.BeheerMerken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">


    <div class="container">

        <h1>Beheer Merken</h1>



        <div class="mb-3">
            <div class="form-label">
                Selecteer een merk:
            </div>
            <div>

                <asp:DropDownList CssClass="form-control" ID="ddlMerk" runat="server"></asp:DropDownList>
            </div>


            <div class="mb-3">



                <div class="form-label">
                    Naam
                </div>
                <div>
                    <asp:TextBox CssClass="form-control" ID="txtWwoord" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
            </div>

        </div>



<div class="row mb-3">
    <div class="col-sm-4">
        <button class="bm-btn btn  w-100">Nieuw</button>
    </div>
    <div class="col-sm-4">
        <button class="bm-btn btn  w-100">Bewaren</button>
    </div>
    <div class="col-sm-4">
        <button class=" bm-btn btn  w-100">Verwijderen</button>
    </div>
</div>





        </div>






</asp:Content>
