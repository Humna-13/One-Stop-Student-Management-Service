<%@ Page Language="C#" AutoEventWireup="true" CodeFile="transcript_view_page.aspx.cs" Inherits="transcript_view_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <script src="https://cdn.tailwindcss.com"></script>
     <style>
        table{
          width:90%; 
          margin-left: 5%;
          margin-top:5%;
          margin-bottom:5%;
          
        }
       th, td {
           height: 50px;
            border-bottom: 1px solid #ddd;
            text-align:left;
  
}
    </style>
    <title>Transcript</title>
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

<!--image section-->

   <section class="text-gray-600 body-font">
  <div class="container px-5 py-20 mx-auto flex flex-col">
    <div class="lg:w-4/6 mx-auto">
     
      <div class="flex flex-col sm:flex-row mt-5">
        <div class="sm:w-1/3 text-center sm:pr-8 sm:py-8">
          <div class="w-20 h-20 rounded-full inline-flex items-center justify-center bg-gray-200 text-gray-400">
            <img src="avatar.png" alt="Sample Photo" />

          </div>
          <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" id="name_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg" Text="Name"></asp:label>
            
          </div>
        </div>
        <div class="flex flex-col sm:w-2/3 sm:pl-8 sm:py-8 sm:border-l border-gray-200 sm:border-t-0 border-t mt-4 pt-4 sm:mt-0 text-center justify-center sm:text-left">
          <asp:label runat="server" id="deg_transcript_label" class="leading-relaxed text-lg mb-4" Text="Degree"></asp:label>
        </div>
      </div>
    </div>
  </div>
</section>
        
        <!--grid 1-->
        <div>
            <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem1_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem1_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
  
                </div>
         <asp:GridView ID="grdUser1" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 2-->
        <div>
           
            <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem2_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem2_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="grdUser2" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 3-->
        <div>
            <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem3_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem3_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 4-->
        <div>
           <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem4_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem4_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 5-->
        <div>
          <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem5_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem5_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 6-->
        <div>
           <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem6_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem6_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 7-->
        <div>
          <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem7_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem7_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        <!--grid 8-->
        <div>
           <div class="flex flex-col items-center text-center justify-center">
            <asp:label runat="server" Text="" id="sem8_transcript_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
            <asp:label runat="server" Text="" id="sem8_sgpa_label" class="font-medium title-font mt-4 text-gray-900 text-lg"></asp:label>
             </div>
         <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="subjects" HeaderText="Subject" />
        <asp:BoundField DataField="grade" HeaderText="Grade" />
        <asp:BoundField DataField="points" HeaderText="Points" />
        <asp:BoundField DataField="credits" HeaderText="Credits" />
      
    </Columns>
</asp:GridView>
         </div>
        
    </form>
</body>
</html>
