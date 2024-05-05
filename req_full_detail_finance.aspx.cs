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
public partial class req_full_detail_finance : System.Web.UI.Page
{
    string fin_id = "", id = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        if (Session["token"] != null)
            id = Session["token"].ToString();
        if (Session["id"] != null)
            fin_id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        SqlCommand cmd = new SqlCommand("select distinct * from request r inner join student s on s.id=r.studentid where r.token=@a1", conn);
        cmd.Parameters.AddWithValue("@a1", id);

        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.HasRows)
            {                
                rid.Text = dr["token"].ToString();               
                track.Text = dr["track"].ToString();
                status.Text = dr["rstatus"].ToString();
                degreefee.Text = dr["degree_fee"].ToString();
                semfee.Text = dr["semester_fee"].ToString();
                finstime.Text = dr["f_starttime"].ToString();
                finetime.Text = dr["f_endttime"].ToString();
            }
            if (dr["decision_finance"].ToString() == "Approved")
            {
                disable_buttons();
                approve_button_id.Text = "Already Approved";
            }
            if (dr["decision_finance"].ToString() == "Rejected")
            {
                disable_buttons();
                approve_button_id.Text = "Already Rejected";
            }
            if (dr["decision_finance"].ToString() == "Objection")
            {
                disable_buttons();
                approve_button_id.Text = "Having Objections";
            }
        }
        dr.Close();

    }

    protected void approve_button(object sender, EventArgs e)
    {
       
            string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
            String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
            DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);

            SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
            conn.Open();
        string query = "update Request SET rstatus=@a1,track=@a2,f_endttime=@a3, decision_finance=@a6, Finance_ID=@a7, comment_finance=@a8 where token=@a5";
          SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", "Pending");    
        cmd.Parameters.AddWithValue("@a2", "Admin");
        cmd.Parameters.AddWithValue("@a3", times);
        cmd.Parameters.AddWithValue("@a5", rid.Text);
        cmd.Parameters.AddWithValue("@a6", "Approved");
        cmd.Parameters.AddWithValue("@a7", fin_id);
        cmd.Parameters.AddWithValue("@a8", "No Comments");
        

            int d = cmd.ExecuteNonQuery();
        if (d > 0)
        {
            approve_button_id.Text = "Request is Approved";
            reject_button_id.Text = "";
            openForm_button.Text = "";
            disable_buttons();
            Thread.Sleep(3000);
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
        string query = "update Request SET status=@a1,track=@a2,f_endtime=@a3,decsion_finance=@a6, Finance_ID=@a7,comment_finance=@a8 where token=@a5";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", "Processed");    
        cmd.Parameters.AddWithValue("@a2", "Processed");
        cmd.Parameters.AddWithValue("@a3", times);        
        cmd.Parameters.AddWithValue("@a5", rid.Text);
        cmd.Parameters.AddWithValue("@a6", "Rejected");
        cmd.Parameters.AddWithValue("@a7", fin_id);
        cmd.Parameters.AddWithValue("@a8", "No Comments");


        int d=cmd.ExecuteNonQuery();
        if (d > 0)
        {
            reject_button_id.Text = "Request is Rejected";
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
        string query = "update Request SET decision_fyp=@a1,Finance_ID=@a4,comment_finance=@a5,rstatus=@a6,track=@a7 where token=@a3";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", "Objection");           
        cmd.Parameters.AddWithValue("@a6", "Processed");           
        cmd.Parameters.AddWithValue("@a7", "Processed");           
        cmd.Parameters.AddWithValue("@a3", rid.Text);
        cmd.Parameters.AddWithValue("@a4", fin_id);
        cmd.Parameters.AddWithValue("@a5", comment.Text);
        

        int d=cmd.ExecuteNonQuery();

        if (d > 0)
        {
            openForm_button.Text = "Objections has Submitted";
            approve_button_id.Text = "";
            reject_button_id.Text = "";

            openForm_button.Text = "";
            Thread.Sleep(3000);
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
        reject_button_id.Enabled = false;
        openForm_button.Enabled = false;
    }

    protected void openForm_button_Click(object sender, EventArgs e)
    {

    }
}