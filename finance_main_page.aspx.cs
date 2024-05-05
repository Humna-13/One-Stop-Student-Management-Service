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
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class finance_main_page : System.Web.UI.Page
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

        if (Request.QueryString["user"] != null)
        {
            id = Request.QueryString["user"];
        }
        else if (Request.QueryString["user"] == "")
            id = "";

        SqlCommand cmd = new SqlCommand("select f_name from finance where id=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
            nav_usr_name.Text = "Hello ! " + dr["f_name"].ToString() + " ";
        conn.Close();
    }
    protected void pending_req_button(object sender, EventArgs e)
    {
        Session["usertype"] = "finance";
        Session["id"] = Session["id"].ToString();
        Session["username"] = nav_usr_name.Text;
        Response.Redirect("pending_req_admin_form.aspx");
    }
    protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("login.aspx");
    }
}