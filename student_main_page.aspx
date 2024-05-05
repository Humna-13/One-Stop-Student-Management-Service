<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_main_page.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Student | ONE Stop</title>
    <style>
    #pop_up{
    position: absolute;
    top: 50%;
    left: 40%;   
    margin:0 auto;
    display: none;
  }
        </style>
</head>
<body>
    
        
                                               
    <form runat="server">
        
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
    <section class="text-gray-600 body-font" id="to_style">
        <div class="container px-5 py-24 mx-auto">
            <div class="flex flex-wrap -m-4">
                <div class="p-4 lg:w-1/4 hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Apply For Degree</h1>
                        <p class="leading-relaxed mb-3">
                            Click here to apply for degree issuance.
                        </p><br />
                       <asp:Button  runat="server" id="apply_deg_button_id" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="apply_for_degree_button"></asp:Button>      

                        
                    </div>
                </div>
                <div class="p-4 lg:w-1/4  hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Complaint Registration</h1>
                        <p class="leading-relaxed mb-3">
                           Complain about degree issues.
                        </p><br />
                        <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="apply_for_complain_button"></asp:Button>      

                        
                    </div>
                </div>
                <div class="p-4 lg:w-1/4 hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Activity Tracking</h1>
                        <p class="leading-relaxed mb-3">
                           Click here to track your request.
                        </p><br />
                        <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="activity_track_button"></asp:Button>      

                        
                    </div>
                </div>
                <div class="p-4 lg:w-1/4 hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Find Your Degree</h1>
                        <p class="leading-relaxed mb-3"> Click here to get your degree.</p><br />
                        <asp:Button  runat="server" id="view_deg_button_id" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="find_degree_button" OnClientClick="this.disabled='true'; this.value='Generating Degree..!';"></asp:Button>      

                        
                    </div>
                </div>
                <div class="p-4 lg:w-1/4 hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">Request Transcript</h1>
                        <p class="leading-relaxed mb-3"> Click here to get request your transcript.</p><br />
                        <asp:Button  runat="server" ID="req_transcript" UseSubmitBehavior="false"  class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClientClick="openForm()" OnClick="req_transcript_button"></asp:Button>      

                        
                    </div>
                </div>
                <div class="p-4 lg:w-1/4 hover:-translate-y-1">
                    <div class="h-full bg-gray-100 bg-opacity-75 px-8 pt-16 pb-24 rounded-lg overflow-hidden text-center relative">
                        
                        <h1 class="title-font sm:text-2xl text-xl font-medium text-gray-900 mb-3">View Transcript</h1>
                        <p class="leading-relaxed mb-3"> View your transcript.</p><br />
                        <asp:Button  runat="server" id="view_transcript"  class="text-white bg-blue-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Click Here" OnClick="view_transcript_button" UseSubmitBehavior="false" OnClientClick="this.disabled='true'; this.value='Generating Transcript..!';" ></asp:Button>      

                        
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--popup-->  
       
            
                         
    <section class="text-gray-600 body-font" id="pop_up">
  
    <div class=" bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
      <asp:Label ID="pop_label" runat="server" class="text-green m-3 justify-center"></asp:Label>
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Your Request have been Submitted</h2>
     
     <div class="flex flex-row  justify-center gap-x-5 mt-3">
      <asp:Button runat="server" required="required" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg"  OnClientClick="closeForm()" Text="Close" ></asp:Button>
    </div>
  </div>
 
</section>
          
         </form>
   
    <!--javascript-->
    <script>
  function openForm() {
    document.getElementById("pop_up").style.display = "block";
    // blur to_style of the page
      document.getElementById("to_style").style.filter = "blur(10px)";
      //sleep page for one second
      
    
  }
  
  function closeForm() {
    document.getElementById("pop_up").style.display = "none";
    // reset blur to default
    document.getElementById("to_style").style.filter = "blur(0px)";
    
    
  }
  function admin_assign_ticket(){
    //disable button
    document.getElementById("openForm_button").disabled = true;
  }
    </script>
</body>
</html>

