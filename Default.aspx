<%@ Page Title="" Language="C#" MasterPageFile="~/Public.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EindOpdracht6DAD.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">



    <%--//van bootstrap--%>


    <div id="carouselExampleCaptions" class="carousel slide carousel slide"
        data-bs-ride="carousel"
        data-bs-interval="4000"
        data-bs-pause="false">
       
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">

            <div class="carousel-item active">
                <img src="Images/ski.jpg" class="d-block w-100" />

                <div class="carousel-caption d-none d-md-block">
                    <h2>Langlaufen</h2>
                    <a class="btnCaroecelDefault" href="Huren.aspx">Klik hier om je langfaufmateriaal te huren.</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="Images/xc.jpg" class="d-block w-100" />
                <div class="carousel-caption d-none d-md-block">
                    <h2>Alpineskiën</h2>
                    <a class="btnCaroecelDefault" href="Huren.aspx">Klik hier om je alpineskiëmateriaal te huren.</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</asp:Content>
