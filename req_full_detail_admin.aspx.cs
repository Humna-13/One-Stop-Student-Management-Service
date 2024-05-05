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

public partial class req_full_detail : System.Web.UI.Page
{
    string admin_id = "", id = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();
        
        if (Session["token"] != null)
            id = Session["token"].ToString();
        if (Session["id"] != null)
            admin_id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        SqlCommand cmd = new SqlCommand("select * from request where token=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);

        SqlDataReader dr = cmd.ExecuteReader();
       
        while (dr.Read())
        {
            
                //nav_usr_name.Text = "Hello ! " + dr["a_name"].ToString() + " ";
                rid.Text = dr["token"].ToString();
                sname.Text = dr["student_name"].ToString();
                sid.Text = dr["studentid"].ToString();
                track.Text = dr["track"].ToString();
                status.Text = dr["rstatus"].ToString();
                findec.Text = dr["Decision_finance"].ToString();
                fypdec.Text = dr["Decision_fyp"].ToString();
                fincom.Text = dr["comment_finance"].ToString();
                fypcom.Text = dr["comment_fyp"].ToString();
            string chck = dr["assign_ticket"].ToString().ToLower();
            if (dr["assign_ticket"].ToString().ToLower() != "")
            {
                openForm_button.Enabled = false;
                openForm_button.Text = "Ticket Assigned";
            }
            if (dr["track"].ToString().ToLower() !="admin")
            {
                send_to_fyp_button_id.Enabled = false;
                send_to_fyp_button_id.Text = "Already Sent to Fyp";
            }

        }
        dr.Close();

    }

    protected void admin_send_fyp_button(object sender, EventArgs e)
    {

        string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
        
        DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);

            SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
            conn.Open();
            string query = "update Request SET AdminID=@a1, Admin_EndTime=@a2, FYP_StartTime=@a3,Track=@a4 where token=@a5";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a1", admin_id);
            cmd.Parameters.AddWithValue("@a2", times);
            cmd.Parameters.AddWithValue("@a3", times);
            cmd.Parameters.AddWithValue("@a4", "FYP");
            cmd.Parameters.AddWithValue("@a5", rid.Text);

            int d = cmd.ExecuteNonQuery();
        if (d > 0)
        {
            
            send_to_fyp_button_id.Enabled = false;
            send_to_fyp_button_id.Text = "Sent to Fyp";
        }
            


            cmd.Dispose();
            conn.Close();
       

    }
    protected void admin_assign_ticket(object sender, EventArgs e)
    {
        Thread.Sleep(3000);
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand("update request set assign_ticket=@a2 where token=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);
        cmd.Parameters.AddWithValue("@a2", date.Text);

        int d=cmd.ExecuteNonQuery();
       if (d > 0)
        {
            openForm_button.Enabled = false;
            openForm_button.Text = "Ticket Assigned";
            
        }
        
        cmd.Dispose();

        conn.Close();

    }
    protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("login.aspx");
    }
    protected void show_detail_page_button(object sender, EventArgs e)
    {

    }


    protected void openForm_button_Click(object sender, EventArgs e)
    {
        
    }
}