<%@ Page Language="C#" AutoEventWireup="true" CodeFile="activity_track_student.aspx.cs" Inherits="activity_track_student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Student | Track Activity</title>

    
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
 <asp:Button  runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" Text="Logout" OnClick="logout_button"></asp:Button>
        </div>
    </header>
  
    
       
    <!--form-->
    
    <!--boxes-->
        <section class="text-gray-600 body-font">
  <div class="container px-5 py-20 mx-auto">
    <div class="flex flex-wrap w-full mb-10 flex-col items-center text-center">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Track Activity</h1>   
    </div>
    <div class="flex flex-wrap -m-4">
      <div class="xl:w-1/5 md:w-1/2 p-4">
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
      <div class="xl:w-1/5 md:w-1/2 p-4">
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
      <div class="xl:w-1/5 md:w-1/2 p-4">
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
      <div class="xl:w-1/5 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Starting Time</h2>
          <asp:Label ID="start_time" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/5 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Expected Date</h2>
          <asp:Label ID="expected_date" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/5 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Completion Time</h2>
          <asp:Label ID="completion_time" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/5 md:w-1/2 p-4">
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
        <div class="xl:w-1/5 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1zM4 22v-7"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">Finance Comment</h2>
          <asp:Label ID="fincom" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
      <div class="xl:w-1/5 md:w-1/2 p-4">
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
        <div class="xl:w-1/5 md:w-1/2 p-4">
        <div class="border border-gray-200 p-6 rounded-lg">
          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-blue-100 text-blue-500 mb-4">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-6 h-6" viewBox="0 0 24 24">
              <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1zM4 22v-7"></path>
            </svg>
          </div>
          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">FYP Comment</h2>
          <asp:Label ID="fypcom" runat="server" class="lg:w-1/2 w-full leading-relaxed text-gray-500"></asp:Label>
        </div>
      </div>
    </div>
     
</section>
    </form>
</body>
</html>
