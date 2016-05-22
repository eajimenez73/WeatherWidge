<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WeatherWidge.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
        <title>3 - Day forcast for Texas Cities</title>
        
        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css'/>

        <!-- Bootsrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>

        <!-- Font awesome -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

        <!-- Template main Css -->
        <link rel="stylesheet" href="assets/css/style.css"/>
      

</head> 
<body>
    <form id="form1" runat="server">
    
    <header class="main-header">
        
    
        <nav class="navbar navbar-static-top">

            <div class="navbar-top">

              <div class="container">
                  <div class="row">

                    <div class="col-sm-6 col-xs-12">

                        <ul class="list-unstyled list-inline header-contact">
                            <li> <i class="fa fa-phone"></i> <a href="tel:">+512.217.9620 </a> </li>
                             <li> <i class="fa fa-envelope"></i> <a href="mailto:ajimenez73@yahoo.com">ajimenez73@yahoo.com</a> </li>
                       </ul> <!-- /.header-contact  -->
                      
                    </div>

                    


                  </div>
              </div>

            </div>

            <div class="navbar-main">
              
              <div class="container">

                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">

                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>

                  </button>
                  
                  <a class="navbar-brand" href="index.html"><img src="assets/images/TWeather-logo.png" alt=""></a>
                  
                </div>

                

              </div> <!-- /.container -->
              
            </div> <!-- /.navbar-main -->


        </nav> 

    </header> <!-- /. main-header -->    
        
     <div class="section-home about-us fadeIn animated">
        <asp:Label ID="ErrorLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Larger" ForeColor="#990000" Visible="false"></asp:Label>
        <div class="container">
            <div><p>
                <h2 class="col-title"><asp:Label ID="CityLabel" runat="server" Text="Austin ."></asp:Label>&nbsp; 
                <asp:LinkButton ID="Day1DetailsLinkButton" runat="server" class="btn btn-primary" OnClick="Day1DetailsLinkButton_Click">Details... +</asp:LinkButton></h2>
            </p>
            </div>
            <br />
            <asp:Panel ID="DetailPanel" runat="server" Visible ="false" >
            <div class="row">

                <div class="col-md-9 col-sm-6">
                
                  <div class="about-us-col">

                        <h3 class="col-title">Weather Details</h3>
                        <div class="col-details">

                          <p>Day Of the Week: <asp:Label ID="DayLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Current Temperature: <asp:Label ID="TempLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Heat Index: <asp:Label ID="HeatIndexLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Climate: <asp:Label ID="ClimateLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Wind Speed: <asp:Label ID="WindLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Dew Point: <asp:Label ID="DewLabel" runat="server" Text=""></asp:Label> </p>
                            <p>Humidity: <asp:Label ID="HumidityLabel" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                    
                  </div>
                  
                </div>
                           
            </div>  <!-- Weather Details -->
            </asp:Panel> <!-- Details for Weather -->
            <br />
            <div class="row">

                <div class="col-md-3 col-sm-4">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="DayImage" runat="server" />
                        </div>
                        <h3 class="col-title">Day 1 - <asp:Label ID="Day1Title" runat="server" Text="Label"></asp:Label></h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day1Label" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                    
                  </div>
                  
                </div>


                <div class="col-md-3 col-sm-4">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="Day2Image" runat="server" />
                        </div>
                        <h3 class="col-title">Day 2 - <asp:Label ID="Day2Title" runat="server" Text="Label"></asp:Label></h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day2Label" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                    
                  </div>
                  
                </div>


                <div class="col-md-3 col-sm-4">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="Day3Image" runat="server" />
                        </div>
                        <h3 class="col-title">Day 3 - <asp:Label ID="Day3Title" runat="server" Text="Label"></asp:Label></h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day3Label" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                    
                  </div>
                  
                </div>


                
                

                
            </div>  <!-- Day Weather -->
            <br />
            <div class="row">

                <div class="col-md-3 col-sm-6">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="Day1NightImage1" runat="server" />
                        </div>
                        <h3 class="col-title">Day 1 - Night</h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day1NightLabel" runat="server" Text=""></asp:Label> </p>
                        </div>
                            
                    
                  </div>
                  
                </div>


                <div class="col-md-3 col-sm-6">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="Day2NightImage" runat="server" />
                        </div>
                        <h3 class="col-title">Day 2 - Night</h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day2NightLabel" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                       
                    
                  </div>
                  
                </div>


                <div class="col-md-3 col-sm-6">
                
                  <div class="about-us-col">

                        <div class="col-icon-wrapper">
                          <asp:Image ID="Day3NightImage" runat="server" />
                        </div>
                        <h3 class="col-title">Day 3 - Night</h3>
                        <div class="col-details">

                          <p><asp:Label ID="Day3NightLabel" runat="server" Text=""></asp:Label> </p>
                          
                        </div>
                        
                    
                  </div>
                  
                </div>    
                          
            </div>  <!-- Nigth Weather -->
            
        </div>
      
    </div> <!-- /.about-us -->


    <footer class="main-footer">


        <div class="footer-bottom">

            <div class="container text-right">
                Powered By <a href="http://www.wunderground.com" target="_blank">
            <img src="assets/images/wundergroundLogo_4c_horz.jpg" alt="" ></a>
            </div>
        </div>
        
    </footer> <!-- main-footer -->

        <div>
    
    </div>
    </form>
</body>
</html>
