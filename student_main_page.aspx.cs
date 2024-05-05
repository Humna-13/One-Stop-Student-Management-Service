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
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Panel = System.Web.UI.WebControls.Panel;

public partial class _Default : System.Web.UI.Page
{
    string id = "", usertype = "", username ="";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        
        if (Session["usertype"] != null)
            usertype = Session["usertype"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();
        
        SqlCommand cmd = new SqlCommand("select * from student where id=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr = cmd.ExecuteReader();

        if (Request.QueryString["user"] != null)
        {
            id = Request.QueryString["user"];
        }
        else if (Request.QueryString["user"] == "")
            id = "";

        while (dr.Read())
            username = dr["sname"].ToString();
            nav_usr_name.Text = "Hello ! " + username;
        dr.Close();

        cmd = new SqlCommand("select * from transcript where studentid=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr["requested"].ToString().ToUpper() == "YES" && dr["granted"].ToString().ToUpper() == "NO")
            {
                 req_transcript.Enabled = false;
                req_transcript.Text = "Request in processed..Please Wait";
                view_transcript.Enabled = false;
                view_transcript.Text = "Let Admin approve your request";
            }
            
            else if (dr["requested"].ToString().ToUpper() == "NO" && dr["granted"].ToString().ToUpper() == "NO")
            {
                req_transcript.Enabled = true;
                view_transcript.Enabled = false;
                view_transcript.Text = "Submit your request";
            }
            else if (dr["requested"].ToString().ToUpper() == "NO" && dr["granted"].ToString().ToUpper() == "YES")
            {
                req_transcript.Enabled = true;
                view_transcript.Enabled = true;
            }

        }
        dr.Close();
        //starts here checking data of degree table if not found than disabling the button
        cmd = new SqlCommand("select * from degree where studentid=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        dr = cmd.ExecuteReader();
        bool chck_data = false;
        while (dr.Read())
        {
            chck_data = true;
        }
        if (!chck_data)
        {
            view_deg_button_id.Enabled = false;
            view_deg_button_id.Text = "Submit You Application";
        }

        conn.Close();

    }
    protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("Login.aspx");
    }

    
        protected void apply_for_degree_button(object sender, EventArgs e)
    {
        //Session["usertype"] = "student";
        /*Session["id"] = Session["id"].ToString();*/
        Session["username"] = nav_usr_name.Text;
        Response.Redirect("apply_for_degree.aspx");
    }

            protected void apply_for_complain_button(object sender, EventArgs e)
    {
        Session["username"]=nav_usr_name.Text;
        Response.Redirect("complain.aspx");
    }
            protected void activity_track_button(object sender, EventArgs e)
    {
        Session["username"] = nav_usr_name.Text;
        Response.Redirect("activity_track_student.aspx");
    }
            protected void find_degree_button(object sender, EventArgs e)
    {
        Session["id"] = Session["id"].ToString();
        Session["username"] = username;
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from degree where studentid=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        
        
        Response.Redirect("degree_view.aspx");
        cmd.Dispose();
        conn.Close();
        
}


    protected void req_transcript_button(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand("update transcript set requested='YES',granted='NO' where studentID= @a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        Thread.Sleep(3000);
      //  ScriptManager.RegisterStartupScript(this.Page, Page.GetType(),"text", "openForm()", true);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
    }

    protected void view_transcript_button(object sender, EventArgs e)
    {
        
        Session["id"] = Session["id"].ToString();
        Session["username"] = username;
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from transcript where studentid=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        Thread.Sleep(3000);
        //  ScriptManager.RegisterStartupScript(this.Page, Page.GetType(),"text", "openForm()", true);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        conn.Close();
        Response.Redirect("transcript_view_page.aspx");
    }
}