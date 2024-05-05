<%@ Page Language="C#" AutoEventWireup="true" CodeFile="director_main_page.aspx.cs" Inherits="director_main_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Director | ONE Stop</title>
    <style>
        #pop_up {
    position: absolute;
    top: 30%;
    left: 40%;
    margin: 0 auto;
    display: none;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
}
    </style>
</head>
<body>
    <!--form-->
    <form id="form1" runat="server">
   <!-- nav bar-->
<header class="text-gray-600 body-font bg-black" >
        <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
           <img src="logos.png" style="width:150px;height:50px"/>
            <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
               <asp:Label ID="nav_usr_name" runat="server" class="text-white"></asp:Label>
               
            </nav>
<asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" Text="Logout" OnClick="logout_button"></asp:Button>      
        </div>
    </header>
    <!--middle three blocks-->
    <section class="text-gray-600 body-font" id="to_style">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-wrap -m-4">
                <div class="p-4 lg:w-1/3">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Requests</h1>
                        <p class="leading-relaxed mb-3">
                            See the students pending requests.
                        </p><br />
                              <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="pending_req_button"></asp:Button>
                       
                    </div>
                    </div>
                <div class="p-4 lg:w-1/3">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Daily Requests</h1>
                        <p class="leading-relaxed mb-3">
                            See the students request according to the daily basis.
                        </p><br />
                              <asp:Button  runat="server"  class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="daily_req_button" OnClientClick="openForm()"></asp:Button>
                      
                    </div>
                </div>               
            </div>
        </div>
    </section>

        <!--pop date form-->
<section class="text-gray-600 body-font" id="pop_up">
  
    <div class=" bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
      <asp:Label ID="pop_label" runat="server" class="text-green m-3 justify-center"></asp:Label>
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Expected Date</h2>
      <div class="relative mb-4">
        <label for="date" class="leading-7 text-sm text-gray-600">Date</label>
        <asp:Textbox runat="server" required="required" id="date" type="date"  class="w-full bg-white rounded border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:Textbox>
      </div>
     <div class="flex flex-row  justify-center gap-x-5 mt-3">
      <asp:Button  runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg" Text="Submit" OnClientClick="assign_ticket_not()" OnClick="director_input_date_button"></asp:Button>
      <asp:Button runat="server"  UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg"  Text="Close" OnClientClick="closeForm()"></asp:Button>
    </div>
  </div>
 
</section>

        </form>

    <script>
  function openForm() {
    document.getElementById("pop_up").style.display = "block";
    // blur to_style of the page
    document.getElementById("to_style").style.filter = "blur(10px)";
    
  }
  
  function closeForm() {
    document.getElementById("pop_up").style.display = "none";
    // reset blur to default
    document.getElementById("to_style").style.filter = "blur(0px)";
    }
    </script>
</body>
</html>
