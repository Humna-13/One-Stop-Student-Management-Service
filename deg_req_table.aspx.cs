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

public partial class deg_req_table : System.Web.UI.Page
{
    public string id = "", usertype = "", pagetype = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["page_type"] != null)
            pagetype = Session["page_type"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        string query = "";

        query = "select * from request where decision_fyp='Approved' and Decision_Finance='Approved' and degree_issued='NO'";

        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grdUser.DataSource = dt;
        grdUser.DataBind();
        bool chck_data = false;
        HtmlGenericControl div;
        for (int i = 0; i < grdUser.Rows.Count; i++)
        {
            div = new HtmlGenericControl("div");
            div.ID = "dv" + i;
            div.InnerText = grdUser.Rows[i].Cells[1].Text;
            chck_data = true;
        }
        if (!chck_data)
        {
            no_data_label.Text = "No Request found";
            request_input_button_id.Visible = false;
            issue_degree_textbox.Visible = false;
        }
        else
            no_data_label.Text = "";
        conn.Close();
    }

    protected void issue_degree(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();

        SqlCommand cmd;
        string query = "";

        string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
        DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);

        query = "update request set degree_issued='YES',e_time=@a1,rstatus=@a2,track=@a3 ";

        cmd = new SqlCommand(query, conn);
        
        cmd.Parameters.AddWithValue("@a1", times);
        cmd.Parameters.AddWithValue("@a2", "Processed");
        cmd.Parameters.AddWithValue("@a3", "Processed");
        int d = -1;
        
           d = cmd.ExecuteNonQuery();
  
        //sessions
        if (d > 0)
        {

            
            string did = "", studentid = "", adminid = "", location = "", degree = "";
            query = "select * from request where decision_fyp='Approved' and Decision_Finance='Approved' and degree_issued='YES' and rstatus='Processed'";
            SqlDataReader dr = new SqlCommand(query, conn).ExecuteReader();
            while (dr.Read())
            {
                did = dr["token"].ToString();
                studentid = dr["studentid"].ToString();
                adminid = dr["adminid"].ToString();
                location = dr["campus"].ToString();
                degree = dr["degree"].ToString();
            }
            dr.Close();
              
                    query = "insert into degree(did,degree_name,adminid,studentid,issued_date,locationname) values(@a1,@a2,@a3,@a4,@a5,@a6)";
            
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a1", did);
            cmd.Parameters.AddWithValue("@a2", degree);
            cmd.Parameters.AddWithValue("@a3", adminid);
            cmd.Parameters.AddWithValue("@a4", studentid);
            cmd.Parameters.AddWithValue("@a5", times);
            cmd.Parameters.AddWithValue("@a6", location);


             d=cmd.ExecuteNonQuery();
            if (d > 0)
                Thread.Sleep(3000);
            cmd.Dispose();
            conn.Close();

        }
    }

    protected void logout_button(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}