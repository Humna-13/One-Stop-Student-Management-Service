<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
   <script type="text/javascript">
      
       function preventBack() { window.history.forward(); }
       setTimeout("preventBack()", 0);
       
       window.onunload = function () { null };
   </script>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
  
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css" />
    <title>OneStop</title>
      
</head>
<body>
    

    
       <div class="container" >
        <!--create from having heading of car details and fields of text input brand, model,price,availabilty-->
         <form id="form1" class="form" runat="server">
            <center><h2>Login</h2></center>
             <div class="clear"></div>
             <center><asp:Label ID="chck_valid" runat="server" class="valid_label"></asp:Label></center>
            
           
                <asp:Textbox class="inputs" type="numeric" placeholder="ID" name="id" id="id" required="required" runat="server" AutoPostBack="True" OnTextChanged="model_TextChanged"></asp:Textbox>
             
             <br/>
            
            <asp:Textbox class="inputs" type="password" placeholder="Password" name="password" id="password" required="required" runat="server"></asp:Textbox><br/>
            <div class="login_drop_down_container">
             <p style="display:inline-block; margin-top:5px;">I am a/an</p>      
            <asp:DropDownList ID="login_choice_dropdown" class="login_choice_dropdown" runat="server"  required="required" >  
            <asp:ListItem Value="" Selected="false" >Select your choice</asp:ListItem>  
            <asp:ListItem Value="student">Student </asp:ListItem>  
            <asp:ListItem Value="fyp">FYP Manager</asp:ListItem>  
            <asp:ListItem Value="admin">Admin</asp:ListItem>  
            <asp:ListItem Value="finance">Finance</asp:ListItem> 
            <asp:ListItem Value="director">Director</asp:ListItem>    
        </asp:DropDownList>  
               </div>
           <center><asp:Button ID="loginbutton" UseSubmitBehavior="false" OnClientClick="this.disabled='true'; this.value='Checking';"   class="login_button" runat="server" Text="Login" OnClick="loginButton_Click"/></center> 


             

             
         </form>
    </div>
   
</body>
</html>
