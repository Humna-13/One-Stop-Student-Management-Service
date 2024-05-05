<%@ Page Language="C#" AutoEventWireup="true" CodeFile="req_full_detail_admin.aspx.cs" Inherits="req_full_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Admin | Request_Details</title>
<style>
  #pop_up,#pop_up1{
    position: absolute;
    top: 30%;
    left: 40%;   
    margin:0 auto;
    display: none;
        box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;

  }
</style>
    
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
 <a  href="login.aspx" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5">Logout</a>
        </div>
    </header>
  
    
       
    <!--form-->
    
    <!--boxes-->
        <section class="text-gray-600 body-font" id="to_style">
  <div class="container px-5 py-20 mx-auto">
    <div class="flex flex-wrap w-full mb-10 flex-col items-center text-center">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Request Details</h1>
       <p style="display: inline;">Request ID</p>
        <asp:Label ID="rid" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>       
    </div>
    <div class="flex flex-wrap -m-4">
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
      
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Student ID</h2>
          <asp:Label ID="sid" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Student Name</h2>
          <asp:Label ID="sname" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Track</h2>
          <asp:Label ID="track" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Status</h2>
          <asp:Label ID="status" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1zM4 22v-7"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Finance Decision</h2>
          <asp:Label ID="findec" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1zM4 22v-7"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">FYP Decision</h2>
          <asp:Label ID="fypdec" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Finance Comment</h2>
          <asp:Label ID="fincom" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">FYP Comment</h2>
          <asp:Label ID="fypcom" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
    </div>
      </div>
     <div class="flex flex-row gap-x-8 justify-center gap-y-8 m-10">
      
    <asp:Button  runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" onclientclick="openForm()" id="openForm_button" Text="Assign Ticket" OnClick="openForm_button_Click"></asp:Button>
    <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Inform Student" OnClick="show_detail_page_button"></asp:Button>
    <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Send To Fyp" id="send_to_fyp_button_id" OnClick="admin_send_fyp_button"></asp:Button>
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
      <asp:Button  runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg" Text="Submit" OnClientClick="assign_ticket_not()" OnClick="admin_assign_ticket"></asp:Button>
      <asp:Button runat="server"  UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg"  Text="Close" OnClientClick="closeForm()"></asp:Button>
    </div>
  </div>
 
</section>

      
      <section class="text-gray-600 body-font" id="pop_up1">
  
    <div class=" bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
      
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Ticket Assigned Succesfully</h2>
     
     <div class="flex flex-row  justify-center gap-x-5 mt-3">
      <asp:Button runat="server" required="required" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg"  OnClientClick="closeForm()" Text="Close" ></asp:Button>
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
    document.getElementById("pop_up1").style.display = "none";
    // reset blur to default
    document.getElementById("to_style").style.filter = "blur(0px)";
    }
    function assign_ticket_not() {
        document.getElementById("pop_up").style.display = "none";
          document.getElementById("pop_up1").style.display = "block";
          // blur to_style of the page
          document.getElementById("to_style").style.filter = "blur(10px)";

      }
  
  function admin_assign_ticket(){
    //disable button
    document.getElementById("openForm_button").disabled = true;
  }
</script>
</body>
</html>
