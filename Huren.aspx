<%@ Page Title="" Language="C#" MasterPageFile="~/Public.master" AutoEventWireup="true" CodeBehind="Huren.aspx.cs" Inherits="EindOpdracht6DAD.Huren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">


        <!-- Left form -->
       
          <div class="container">
              <h3 class="text-center"> Alpienskie's huren</h3>


              <div class="row">

                  <div class="col-sm-6">

             
                <div class="mb-3">
                    <label for="startDate" class="form-label">Begindatum huren:</label>
                    <input type="date" class="form-control" id="startDate" value="2026-03-19">
                </div>
                <div class="mb-3">
                    <label for="endDate" class="form-label">Einddatum huren:</label>
                    <input type="date" class="form-control" id="endDate" value="2026-03-20">
                </div>
                <div class="mb-3">
                    <label for="type" class="form-label">Type materiaal:</label>
                    <select class="form-select" id="type">
                        <option>Alpine ski</option>
                        <option>Snowboard</option>
                        <option>Ski poles</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="brand" class="form-label">Merk:</label>
                    <select class="form-select" id="brand">
                        <option>Atomic</option>
                        <option>Salomon</option>
                        <option>Rossignol</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="material" class="form-label">Materiaal:</label>
                    <select class="form-select" id="material">
                        <option>Redster G9 Revoshock S + I GW</option>
                        <option>Redster X9</option>
                        <option>Redster S9</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="size" class="form-label">Maten:</label>
                    <select class="form-select" id="size">
                        <option>151</option>
                        <option>160</option>
                        <option>170</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Nog beschikbaar:</label>
                    <input type="text" class="form-control" value="15" readonly disabled="disabled">
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Aantal huren:</label>
                    <input type="number" class="form-control" id="quantity" value="0" min="0">
                </div>
                   </div>

                  <div class="col-sm-6">
                    <img src="Images/no-image-available.png" />
                  </div>
                  </div>
               

       <div class="row mb-3">
           <div class="col-sm-4">
                <a class="h-btn">Toevoegen aan winkelmand</a>
           </div>
           <div class="col-sm-4">
               <a class="h-btn">Toon winkelmand</a>
           </div>
           <div class="col-sm-4">
                 <a class="h-btn">Huur bevestigen</a>
           </div>


    
        
         
       
        
     </div>

           
  </div>

</asp:Content>
