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

public partial class req_full_detail_fyp : System.Web.UI.Page
{
    string fyp_id = "", id = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();

        if (Session["token"] != null)
            id = Session["token"].ToString();
        if (Session["id"] != null)
            fyp_id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        SqlCommand cmd = new SqlCommand("select * from request where token=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);

        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.HasRows)
            {             
                
                rid.Text = dr["token"].ToString();               
                track.Text = dr["track"].ToString();
                status.Text = dr["rstatus"].ToString();
                degree.Text = dr["degree"].ToString();
                cgpa.Text = dr["cgpa"].ToString();
                fypstime.Text = dr["fyp_starttime"].ToString();
                fypetime.Text = dr["fyp_endtime"].ToString();
            }
            if(dr["decision_fyp"].ToString() == "Approved") { disable_buttons();
                approve_button_id.Text = "Already Approved";
            }
            if(dr["decision_fyp"].ToString() == "Rejected") { disable_buttons();
                approve_button_id.Text = "Already Rejected";
            }
            if(dr["decision_fyp"].ToString() == "Objections") { disable_buttons();
                approve_button_id.Text = "Having Objection";
            }
        }
        dr.Close();

    }
    protected void approve_button(object sender, EventArgs e)
    {
       
            string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
            String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
            DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);

            SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
            conn.Open();
            string query = "update Request SET fyp_endtime=@a1,f_starttime=@a2,track=@a3, decision_fyp=@a5,fyp_id=@a6, comment_fyp=@a7 where token=@a4";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a1", times);
            cmd.Parameters.AddWithValue("@a2", times);
            cmd.Parameters.AddWithValue("@a3", "Finance");
            cmd.Parameters.AddWithValue("@a4", rid.Text);
            cmd.Parameters.AddWithValue("@a5", "Approved");
            cmd.Parameters.AddWithValue("@a6", fyp_id);
            cmd.Parameters.AddWithValue("@a7", "No Comments");

            int d = cmd.ExecuteNonQuery();
            if(d> 0) { approve_button_id.Text = "Request is Approved";
            reject_button_id.Text = "";
            openForm_button.Text = "";
            Thread.Sleep(3000);
            disable_buttons();        
        }
            
            cmd.Dispose();
            conn.Close();
        
    }
    protected void reject_button(object sender, EventArgs e)
    {
         string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
        DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);

        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();
        string query = "update Request SET status=@a1,track=@a2,fyp_endtime=@a3,e_time=@a4, decision_fyp=@a6 ,fyp_id=@a7, comment_fyp=@a8 where token=@a5";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", "Processed");    
        cmd.Parameters.AddWithValue("@a2", "Processed");
        cmd.Parameters.AddWithValue("@a3", times);
        cmd.Parameters.AddWithValue("@a4", times);
        cmd.Parameters.AddWithValue("@a5", rid.Text);
        cmd.Parameters.AddWithValue("@a6", "Reject");
        cmd.Parameters.AddWithValue("@a7", fyp_id);
        cmd.Parameters.AddWithValue("@a8", "No Comments");

        int d=cmd.ExecuteNonQuery();

        if (d > 0) { reject_button_id.Text = "Request is Rejected";
         approve_button_id.Text = "";
                openForm_button.Text = "";
            Thread.Sleep(3000);
                disable_buttons();
        }
        cmd.Dispose();
        conn.Close();
    }
    protected void objection_button(object sender, EventArgs e){
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();
        string query = "update Request SET decision_fyp=@a1 ,fyp_id=@a4,comment_fyp=@a5,rstatus=@a6,track=@a7 where token=@a3";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", "Objection");
        cmd.Parameters.AddWithValue("@a6", "Processed");
        cmd.Parameters.AddWithValue("@a7", "Processed");
        cmd.Parameters.AddWithValue("@a3", rid.Text);
        cmd.Parameters.AddWithValue("@a4", fyp_id);
        cmd.Parameters.AddWithValue("@a5", comment.Text);
        

        int d=cmd.ExecuteNonQuery();
        if (d > 0) { openForm_button.Text = "Objection is Submitted";
            approve_button_id.Text = "";
            openForm_button.Text = "";
            disable_buttons();
        
        }
        
        cmd.Dispose();

        conn.Close();
    }

    protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("~/login.aspx");
    }

    void disable_buttons()
    {
        approve_button_id.Enabled = false;
        reject_button_id.Enabled=false;
        openForm_button.Enabled=false;
    }
    protected void openForm_button_Click(object sender, EventArgs e)
    {

    }
}