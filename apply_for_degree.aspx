<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apply_for_degree.aspx.cs" Inherits="apply_for_degree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Degree Application</title>
    <script src="https://cdn.tailwindcss.com"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css" />
   
</head>
<body>

      <form id="form1" runat="server">
   <!-- nav bar-->

   <header class="text-gray-600 body-font bg-black h-20">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
       <img src="logos.png" style="width:150px;height:50px"/>
        <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
           <asp:Label ID="nav_usr_name" runat="server" class="text-white"></asp:Label>
           
        </nav>
        <a href="login.aspx" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursorn ml-5">Logout</a>

    </div>
</header>
        <!-- main body constructions starts here-->
        
   
<section class="text-gray-600 body-font relative">
  <div class="container px-5 py-20 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Degree Application</h1>
    </div>
    <div class="lg:w-1/2 md:w-2/3 mx-auto">
      <div class="flex flex-wrap -m-2">
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="id" class="leading-7 text-sm text-gray-600">Student ID</label>
        <asp:Textbox runat="server" required="required"  id="id" type="numeric"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="name" class="leading-7 text-sm text-gray-600">Name</label>
        <asp:Textbox runat="server" required="required"  id="name" type="text"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="fname" class="leading-7 text-sm text-gray-600">Father Name</label>
        <asp:Textbox runat="server" required="required"  id="fname" type="text"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="address" class="leading-7 text-sm text-gray-600">Address</label>
        <asp:Textbox runat="server" required="required"  id="address" type="text"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
          
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="email" class="leading-7 text-sm text-gray-600">Email</label>
        <asp:Textbox runat="server" required="required" placeholder="email" id="email" type="email"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
          <div class="p-2 w-1/2">
          <div class="relative">
            <label for="degree" class="leading-7 text-sm text-gray-600">Degree</label>
        <asp:Textbox runat="server" required="required"  id="degree" type="text" placeholder="CS/DS/AI" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
          <div class="p-2 w-1/2">
          <div class="relative">
            <label for="phone" class="leading-7 text-sm text-gray-600">Campus</label>
        <asp:Textbox runat="server" required="required"  id="campus" placeholer="Islamabad/Lahore" type="text"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="cgpa" class="leading-7 text-sm text-gray-600">CGPA</label>
        <asp:Textbox runat="server" required="required" placeholder="3.5" id="cgpa" type="numeric"  class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-blue-500 focus:bg-white focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        
        <div class="p-2 w-full">
          <asp:Button  runat="server" class="flex mx-auto text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg mt-10" Text="Submit" OnClick="Deg_submit_Button_Click"></asp:Button>
        </div>
      </div>
    </div>
  </div>
</section>



            </form>
    
</body>
</html>



