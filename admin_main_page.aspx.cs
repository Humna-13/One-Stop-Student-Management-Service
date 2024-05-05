using System.Windows.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Threading;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "", usertype = "";
        if (Session["usertype"] != null)
            usertype = Session["usertype"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();

        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
       

         SqlCommand cmd = new SqlCommand("select a_name from admin where id=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
            nav_usr_name.Text = "Hello ! " + dr["a_name"].ToString() + " ";
        
        conn.Close();
    }
    protected void pending_req_button(object sender, EventArgs e)
    {
        Session["page"] = "request";
        Session["id"] = Session["id"].ToString();
        Session["username"] = nav_usr_name.Text;
        
        Response.Redirect("pending_req_admin_form.aspx");
    }
    protected void transcript_req_button(object sender, EventArgs e)
    {
        Session["page"] = "issue_transcript";
        Session["id"] = Session["id"].ToString();
        Session["username"] = nav_usr_name.Text;
       
        Response.Redirect("transcript_req_table_page.aspx");
    }
    protected void issue_deg_button(object sender, EventArgs e)
    {
        Session["page"] = "issue_deg";
        Session["id"] = Session["id"].ToString();
        Session["username"] = nav_usr_name.Text;
        
        Response.Redirect("deg_req_table.aspx");
    }
    protected void logout_button(object sender, EventArgs e)
    {
        
        Response.Redirect("Login.aspx");
    }

}