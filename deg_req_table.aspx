<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deg_req_table.aspx.cs" Inherits="deg_req_table" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Degree Issue Requests</title>
    
    <style>

 #pop_up{
    position: absolute;
    top: 40%;
    left: 40%;   
    margin:0 auto;
    display: none;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
  }

        table{
          width:90%; 
          margin-left: 5%;   
          
        }
       th, td {
           height: 50px;
  border-bottom: 1px solid #ddd;
  text-align:left;
  
}


    </style>
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
 <asp:Button  runat="server" UseSubmitBehavior="false" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" Text="Logout" OnClick="logout_button"></asp:Button>
        </div>
    </header>
  
       <!--Search-->
    
       <section class="text-gray-600 body-font" id="to_style">
        <div class="container px-5 py-24 mx-auto">
          
          <div class="flex lg:w-1/2 w-full sm:flex-row flex-col mx-auto px-8 sm:space-x-4 sm:space-y-0 space-y-4 sm:px-0 items-end">

            <div class="relative flex-grow w-full">
              <asp:TextBox  runat="server" placeholder="Enter ID to Issue Degree" type="text" id="issue_degree_textbox" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:TextBox>
            </div>
            <asp:Button  runat="server"  OnClick="issue_degree" id="request_input_button_id" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Issue" OnClientClick="openForm()"></asp:Button>
          </div>
        </div>
      </section>

        
                                           
        <div class="grid justify-items-stretch">
            
             <asp:label runat="server" id="no_data_label" Text="" class="justify-self-center text-center text-gray-600"></asp:label>
     <asp:GridView ID="grdUser" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Token" HeaderText="Token ID" />
        <asp:BoundField DataField="Studentid" HeaderText="Student ID" />
        <asp:BoundField DataField="Student_Name" HeaderText="Name" />
        <asp:BoundField DataField="Father_Name" HeaderText="Father Name" />
        <asp:BoundField DataField="Degree" HeaderText="Degree" />
        <asp:BoundField DataField="degree_issued" HeaderText="Issued" />

    </Columns>
</asp:GridView>
            
        </div>
        
        <!--popup-->
      <section class="text-gray-600 body-font" id="pop_up">
  
    <div class=" bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
     
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Issued Successfully</h2>
     
     <div class="flex flex-row  justify-center gap-x-5 mt-3">
      <asp:Button runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg"  OnClientClick="closeForm()" Text="Close" ></asp:Button>
    </div>
  </div>
 
</section>
    </form>

    <script>
        function openForm() {
            document.getElementById("pop_up").style.display = "block";
            document.getElementById("to_style").style.filter = "blur(10px)";

        }
        function closeForm() {
            document.getElementById("pop_up").style.display = "none";
            document.getElementById("to_style").style.filter = "blur(0px)";
        }
    </script>
</body>
</html>
