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

public partial class req_full_detail_director : System.Web.UI.Page
{
    string director_id = "", id = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        if (Session["token"] != null)
            id = Session["token"].ToString();
        if (Session["id"] != null)
            director_id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        string admin_time = "", fyp_time = "", finance_time = "", total_time = "";
        string query = "WITH difference_in_seconds AS (SELECT DATEDIFF(SECOND, r.Admin_StartTime, r.Admin_EndTime) AS seconds FROM request r where token  =@a1),differences AS(" +
  "SELECT seconds, seconds % 60 AS seconds_part, seconds % 3600 AS minutes_part, seconds % (3600 * 24) AS hours_part FROM difference_in_seconds )" +
"SELECT CONCAT( FLOOR(seconds / 3600 / 24), ' days ',FLOOR(hours_part / 3600), ' hours ', FLOOR(minutes_part / 60), ' minutes ',seconds_part, ' seconds') AS difference FROM differences";
            
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            admin_time = dr["difference"].ToString();
        }
        dr.Close();
        query = "WITH difference_in_seconds AS (SELECT DATEDIFF(SECOND, r.FYP_StartTime, r.FYP_Endtime) AS seconds FROM request r where token  =@a1),differences AS(" +
  "SELECT seconds, seconds % 60 AS seconds_part, seconds % 3600 AS minutes_part, seconds % (3600 * 24) AS hours_part FROM difference_in_seconds )" +
"SELECT CONCAT( FLOOR(seconds / 3600 / 24), ' days ',FLOOR(hours_part / 3600), ' hours ', FLOOR(minutes_part / 60), ' minutes ',seconds_part, ' seconds') AS difference FROM differences";

        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
         dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            fyp_time = dr["difference"].ToString();
        }
        dr.Close();
        query = "WITH difference_in_seconds AS (SELECT DATEDIFF(SECOND, r.F_StartTime, r.F_EndtTime) AS seconds FROM request r where token  =@a1),differences AS(" +
  "SELECT seconds, seconds % 60 AS seconds_part, seconds % 3600 AS minutes_part, seconds % (3600 * 24) AS hours_part FROM difference_in_seconds )" +
"SELECT CONCAT( FLOOR(seconds / 3600 / 24), ' days ',FLOOR(hours_part / 3600), ' hours ', FLOOR(minutes_part / 60), ' minutes ',seconds_part, ' seconds') AS difference FROM differences";
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            finance_time = dr["difference"].ToString();
        }
        dr.Close();
        
        query = "WITH difference_in_seconds AS (SELECT DATEDIFF(SECOND, r.s_time, r.e_time) AS seconds FROM request r where token  =@a1),differences AS(" +
 "SELECT seconds, seconds % 60 AS seconds_part, seconds % 3600 AS minutes_part, seconds % (3600 * 24) AS hours_part FROM difference_in_seconds )" +
"SELECT CONCAT( FLOOR(seconds / 3600 / 24), ' days ',FLOOR(hours_part / 3600), ' hours ', FLOOR(minutes_part / 60), ' minutes ',seconds_part, ' seconds') AS difference FROM differences";
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            total_time = dr["difference"].ToString();
        }
        dr.Close();
        query = "select * from request where token=@a1";
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {

            rid.Text = dr["token"].ToString();
            finance_time_taken_label.Text = finance_time;
            fyp_time_taken_label.Text = fyp_time;
            admin_time_taken_label.Text = admin_time;
            total_time_label.Text = total_time;
            track.Text = dr["track"].ToString();
            status.Text = dr["rstatus"].ToString();
            findec.Text = dr["Decision_finance"].ToString();
            fypdec.Text = dr["Decision_fyp"].ToString();
           

        }
        dr.Close();

    }
}