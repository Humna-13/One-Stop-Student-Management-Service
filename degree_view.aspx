<%@ Page Language="C#" AutoEventWireup="true" CodeFile="degree_view.aspx.cs" Inherits="degree_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
     <script src="https://cdn.tailwindcss.com"></script>
    <title>Degree View</title>
</head>
<body>
    <!-- nav bar-->
    <form id="form1" runat="server">
        <header class="text-gray-600 body-font bg-black">
        <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
            <img src="logos.png" style="width:150px;height:50px"/>
            <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
               <asp:Label ID="nav_usr_name" runat="server" class="text-white"></asp:Label>
               
            </nav>
 <a class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" href="login.aspx">Logout</a>
        </div>
    </header>
    </form>
    
         <section class="text-gray-600 body-font relative">
  <div class="container px-5 py-20 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Certificate of Graduation</h1>
    </div>
    <div class="lg:w-1/2 md:w-2/3 mx-auto">
      <div class="flex flex-wrap -m-2">
        <div class="p-2 w-full">
          <div class="relative">        
              <h3 for="name" class="leading-7 text-sm text-gray-600 text-center">THIS CERTIFICATE ACKNOWLEDGES THAT</h3>
          </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
             <asp:label runat="server" id="name_of_deg_label" Text="Name" for="name" class="flex flex-col justify-center leading-7 text-lg text-black-1000 text-center underline decoration-2"></asp:label>
           
          </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
            <h3 for="name" class="leading-7 text-sm text-gray-600 text-center">HAS SUCCESSFULLY COMPLETED THE COURSE OF STUDY</h3>
          </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
             <asp:label runat="server" id="cert_deg_lable" Text="Degree" for="name" class=" flex flex-col justify-center  leading-7 text-lg text-black-1000 text-center underline decoration-2"></asp:label>
              </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
            <h3 for="name" class="leading-7 text-sm text-gray-600 text-center">ISSUED ON</h3>
            <asp:label runat="server" id="date_deg_label" Text="location" for="loc" class="flex flex-col justify-center  leading-7 text-lg text-black-1000 text-center underline decoration-2"></asp:label>

          </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
            <h3 for="name" class="leading-7 text-sm text-gray-600 text-center">AT</h3>

          </div>
        </div>
          <div class="p-2 w-full">
          <div class="relative">        
            <asp:label runat="server" id="location_deg_label" Text="location" for="loc" class="flex flex-col justify-center  leading-7 text-lg text-black-1000 text-center underline decoration-2"></asp:label>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
        
    
</body>
</html>
