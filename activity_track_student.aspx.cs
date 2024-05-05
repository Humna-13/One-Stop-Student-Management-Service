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

public partial class activity_track_student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
              SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        string id = "";
        if (Session["username"] != null)
            nav_usr_name.Text =Session["username"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();
        
        SqlCommand cmd = new SqlCommand("select * from request r inner join student s on r.studentid=s.id;", conn); //this query has to be wriiten
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read()){
            if(dr.HasRows){
                
                sid.Text = id;
                track.Text = dr["track"].ToString();
                status.Text = dr["rstatus"].ToString();
                findec.Text = dr["Decision_finance"].ToString();
                fypdec.Text = dr["Decision_fyp"].ToString();
                completion_time.Text = dr["e_time"].ToString(); 
                expected_date.Text = dr["assign_ticket"].ToString(); 
                start_time.Text = dr["s_time"].ToString();
                fincom.Text = dr["comment_finance"].ToString();
                fypcom.Text = dr["comment_fyp"].ToString();
            }

        }
    }

     protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("login.aspx");
    }
}