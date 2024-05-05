<%@ Page Language="C#" AutoEventWireup="true" CodeFile="transcript_req_table_page.aspx.cs" Inherits="transcript_req_table_page" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Transcript Requests</title>
<!-- <link rel="stylesheet" href="style.css" /> -->
    <style>
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
 <asp:Button  runat="server" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor ml-5" Text="Logout" OnClick="logout_button"></asp:Button>
        </div>
    </header>
  
       <!--Search-->
    
       <section class="text-gray-600 body-font">
        <div class="container px-5 py-24 mx-auto">
          
          <div class="flex lg:w-1/2 w-full sm:flex-row flex-col mx-auto px-8 sm:space-x-4 sm:space-y-0 space-y-4 sm:px-0 items-end">
            <div class="relative flex-grow w-full">
              <asp:DropDownList id="drop_down_req_menu" class="w-full h-10 bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
              runat="server"  required="required" AutoPostBack="True" OnSelectedIndexChanged="drop_down_req_menu_SelectedIndexChanged">  
                <asp:ListItem Value="allreq" >All Requests</asp:ListItem>
                  <asp:ListItem Value="pending" >Pending </asp:ListItem>  
                <asp:ListItem Value="issued">Issued</asp:ListItem>  
                   
            </asp:DropDownList>            </div>
            <div class="relative flex-grow w-full">
              <asp:TextBox  runat="server" placeholder="Enter ID to Issue Transcript" type="text" id="issue_transcript_textbox" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-transparent focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"></asp:TextBox>
            </div>
            <asp:Button  runat="server" OnClick="Issue_transcript" id="request_input_button_id" class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lgn pointer-cursor" Text="Issue" ></asp:Button>
          </div>
        </div>
      </section>

        
                                           
        <div class="grid justify-items-stretch">
            
             <asp:label runat="server" id="no_data_label" Text="" class="justify-self-center text-center text-gray-600"></asp:label>
     <asp:GridView ID="grdUser" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="TID" HeaderText="ID" />
        <asp:BoundField DataField="Studentid" HeaderText="Student ID" />
        <asp:BoundField DataField="sname" HeaderText="Student Name" />
        <asp:BoundField DataField="Degree" HeaderText="Degree" />
        <asp:BoundField DataField="granted" HeaderText="Issued" />
        


    </Columns>
</asp:GridView>
            
        </div>
    
    </form>
</body>
</html>
