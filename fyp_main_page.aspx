<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fyp_main_page.aspx.cs" Inherits="fyp_main_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <title>FYP Manager | ONE Stop</title>
</head>
<body>
    <!--form-->
    <form id="form1" runat="server">
   <!-- nav bar-->
<header class="text-gray-600 body-font bg-black">
        <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
          <img src="logos.png" style="width:150px;height:50px"/>
            <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
               <asp:Label ID="nav_usr_name" runat="server" class="text-white"></asp:Label>
               
            </nav>
<asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" Text="Logout" OnClick="logout_button"></asp:Button>      
        </div>
    </header>
    <!--middle three blocks-->
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-wrap -m-4">
                <div class="p-4 lg:w-1/3">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Pending Requests</h1>
                        <p class="leading-relaxed mb-3">
                            See the students pending requests, assign them tokens and send them forward for further
                            processing. Also inform students of requests that got objection from FYP or Finance.
                        </p><br />
                              <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="pending_req_button"></asp:Button>
                       
                    </div>
                </div>               
            </div>
        </div>
    </section>
        </form>
</body>
</html>