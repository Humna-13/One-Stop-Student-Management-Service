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

public partial class transcript_req_table_page : System.Web.UI.Page
{
    public string id = "", usertype = "", pagetype = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        /*if (Session["page_type"] != null)
            pagetype = Session["page_type"].ToString();*/
        if (Session["id"] != null)
            id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

        string query = "";
        
             query = "select * from transcript t,student s where t.studentid=s.id and t.requested='YES'";
        
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
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
            no_data_label.Text = "No Request found";
        else
            no_data_label.Text = "";
    }

    protected void Issue_transcript(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=HARIS\\SQLEXPRESS;Initial Catalog=db_project;Integrated Security=True");
        conn.Open();

        SqlCommand cmd;
        string query = "";

  
        query = "update transcript set requested='NO',granted='YES',adminid=@a1 where tid=@a2";

        string chck = issue_transcript_textbox.Text;
        cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a2", issue_transcript_textbox.Text);
        cmd.Parameters.AddWithValue("@a1", id);

        cmd.ExecuteNonQuery();
        //sessions


        cmd.Dispose();
        conn.Close();
    }
    protected void drop_down_req_menu_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        string query = "";

        string chck = drop_down_req_menu.SelectedValue.ToUpper();

        
            if (drop_down_req_menu.SelectedValue.ToUpper() == "PENDING") { query = "select * from transcript t,student s where  t.studentid=s.id and t.requested='YES' and t.granted='NO'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "ISSUED") { query = "select * from transcript t,student s where t.studentid=s.id and t.granted='YES'"; }
            else if (drop_down_req_menu.SelectedItem.Text.ToUpper() == "ALL REQUESTS") { query = "select * from transcript t,student s where t.studentid=s.id and t.requested='YES'"; }
        
        
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.CommandText = query;
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
            no_data_label.Text = "No Request found";
        else
            no_data_label.Text = "";
        conn.Close();

    }
    protected void logout_button(object sender, EventArgs e)
    {

        Response.Redirect("Login.aspx");
    }

}