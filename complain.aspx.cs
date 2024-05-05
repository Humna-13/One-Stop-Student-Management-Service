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
public partial class comlain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();
        if(drop_down_req_menu.SelectedValue.ToUpper() == "-1")
        {
            name_correction_id.Visible = true;
            degree_correction_id.Visible = true;
            campus_correction_id.Visible = true;

        }
        
          
    }

    protected void submit_complain(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd=new SqlCommand();
        string query = "";
        if (drop_down_req_menu.SelectedValue.ToUpper() == "NAME_CORR")
        {
            query = "insert into request set student_name = @a1 where studentid=@a2";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a2", id);
            cmd.Parameters.AddWithValue("@a1", name_correction_id.Text);
        }
        else if (drop_down_req_menu.SelectedValue.ToUpper() == "DEGREE_CORR")
        {
            query = "insert into request set degree = @a1 where studentid=@a2";
             cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a2", id);
            cmd.Parameters.AddWithValue("@a1", degree_correction_id.Text);
        }
        else if (drop_down_req_menu.SelectedValue.ToUpper() == "CAMPUS_CORR")
        {
            query = "insert into request set campus = @a1 where studentid=@a2";
             cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a2", id);
            cmd.Parameters.AddWithValue("@a1", campus_correction_id.Text);
        }
        else if (drop_down_req_menu.SelectedValue.ToUpper() == "-1")
        {
            query = "insert into request set student_name = @a1, degree=@2 , campus=@a3 where studentid=@a4";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a4", id);
            cmd.Parameters.AddWithValue("@a1", name_correction_id.Text);
            cmd.Parameters.AddWithValue("@a2", degree_correction_id.Text);
            cmd.Parameters.AddWithValue("@a3", campus_correction_id.Text);
        }

        int d = cmd.ExecuteNonQuery();
        if (d > 0)   
            Response.Redirect("student_main_page.aspx");
     

    }

    protected void drop_down_req_menu_SelectedIndexChanged(object sender, EventArgs e)
    {
        string chck = drop_down_req_menu.SelectedValue.ToUpper();
        if (drop_down_req_menu.SelectedValue.ToUpper() == "NAME_CORR") {
            name_correction_id.Visible = true;     
            degree_correction_id.Visible = false;
            campus_correction_id.Visible = false;
        }
        else if (drop_down_req_menu.SelectedValue.ToUpper() == "DEGREE_CORR") { degree_correction_id.Visible = true;
            name_correction_id.Visible = false; 
            campus_correction_id.Visible = false;
        }
        else if (drop_down_req_menu.SelectedValue.ToUpper() == "CAMPUS_CORR") { campus_correction_id.Visible = true;
            name_correction_id.Visible = false;
            degree_correction_id.Visible = false;
           
        }

    }
}