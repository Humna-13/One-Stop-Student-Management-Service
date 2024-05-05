<%@ Page Language="C#" AutoEventWireup="true" CodeFile="complain.aspx.cs" Inherits="comlain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src="https://cdn.tailwindcss.com"></script>
    <title>Complaint Registration</title>
</head>
<body>
    <form id="form1" runat="server">
               <!-- nav bar-->
<header class="text-gray-600 body-font bg-black">
        <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
             <img src="logos.png" style="width:150px;height:50px"/>
            <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
               <asp:Label ID="nav_usr_name" runat="server" class="text-white"></asp:Label>
               
            </nav>
 <a class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" href="login.aspx">Logout</a>
        </div>
    </header>
        
        <section class="text-gray-600 body-font relative">
  <div class="container px-5 py-20 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">How Can We HELP You!</h1>
      <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Submit Your Queries and issues below.We will try to assist your as soon as possible</p>
    </div>
    <div class="lg:w-1/2 md:w-2/3 mx-auto">
      <div class="flex flex-wrap -m-2">
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="name" class="leading-7 text-sm text-gray-600">ID</label>
            <asp:Textbox runat="server" required="required" type="numeric" id="id" name="id" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="name" class="leading-7 text-sm text-gray-600">Name</label>
            <asp:Textbox runat="server" required="required" type="text" id="name" name="name" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
          <div class="p-2 w-full">
              <div class="relative">
                   <asp:DropDownList id="drop_down_req_menu" class="w-full h-10 bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
              runat="server"  required="required" AutoPostBack="True" OnSelectedIndexChanged="drop_down_req_menu_SelectedIndexChanged">  
                <asp:ListItem Value="-1" Selected="true">Select all</asp:ListItem>
                <asp:ListItem Value="name_corr" >Name Correction</asp:ListItem>
                  <asp:ListItem Value="campus_corr" >Campus Correction</asp:ListItem>  
                  <asp:ListItem Value="degree_corr">Degree Correction</asp:ListItem>             
            </asp:DropDownList>
              </div>
          </div>
        <div class="p-2 w-full">
          <div class="relative flex flex-col">
          
            <asp:Textbox runat="server" id="name_correction_id" placeholder="Enter your name" required="required" name="name" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
            <asp:Textbox runat="server" id="campus_correction_id" placeholder="Enter your campus name" required="required" name="campus" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
            <asp:Textbox runat="server" id="degree_correction_id" placeholder="Enter your degree name" required="required" name="degree" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
          </div>
        </div>
        <div class="p-2 w-full">
          <asp:Button runat="server" Text="Submit" OnClick="submit_complain" class="flex mx-auto text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg" UseSubmitBehavior="false" OnClientClick="this.disabled='true'; this.value='Submitted';"></asp:Button>
        </div>
        
      </div>
    </div>
  </div>
</section>
        
    </form>
</body>
</html>
