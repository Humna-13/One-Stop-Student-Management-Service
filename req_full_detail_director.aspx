<%@ Page Language="C#" AutoEventWireup="true" CodeFile="req_full_detail_director.aspx.cs" Inherits="req_full_detail_director" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Director | Request_Details</title>
<style>
  #pop_up{
    position: absolute;
    top: 50%;
    left: 40%;   
    margin:0 auto;
    display: none;
  }
  #pop_up1{
    position: absolute;
    top: 50%;
    left: 40%;   
    margin:0 auto;
    display: none;
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
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Time Taken Admin</h2>
          <asp:Label ID="admin_time_taken_label" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Time Taken FYP</h2>
          <asp:Label ID="fyp_time_taken_label" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Time Taken Finance</h2>
          <asp:Label ID="finance_time_taken_label" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
        <div class="xl:w-1/4 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Total Time</h2>
          <asp:Label ID="total_time_label" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
    </div>
      </div>
     
</section>
   
</form>
</body>
</html>
