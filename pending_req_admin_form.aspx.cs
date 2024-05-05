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

public partial class pending_req_admin_form : System.Web.UI.Page
{
    public string id = "", usertype = "",page="";
    protected void Page_Load(object sender, EventArgs e)
    {
        total_req_count.Visible = false;
        total_req_count.Text = "";
        if (Session["usertype"] != null)
            usertype = Session["usertype"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();
        if (Session["page"] != null)
            page = Session["page"].ToString();
       

        string query ="";
        if (usertype == "fyp")
            query = "select * from request where fyp_id = @a1 or track = 'fyp'";
        else if (usertype == "admin" || usertype == "director")
            query = "select * from request";
        else if (usertype == "finance")
            query = "select * from request where finance_id = @a1 or track = 'finance'";
        if (page == "daily_req")
        {
            total_req_count.Visible = true;
            drop_down_req_menu.Visible = false;
            query = "select * from (select count(*) as count from request where e_time<=@a1 and s_time>=@a1)t,Request where e_time<=@a1 and s_time>=@a1";
        }
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
        if (page == "daily_req")
        {
            cmd.Parameters.AddWithValue("@a1", Session["date"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if(!dr.HasRows)
                total_req_count.Text = "Total requests on " + Session["date"].ToString() + " : 0";

            while (dr.Read())
                total_req_count.Text ="Total requests on "+ Session["date"].ToString() +" : "+ dr["count"].ToString();
            dr.Close();
        }
        else
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


    protected void show_detail_page_button(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        
        SqlCommand cmd;
        string query = "";
        
        
            query = "select token from request where token=@a1";
            Session["id"] = Session["id"].ToString();
            Session["token"] = view_req_detail.Text;
            Session["username"] = nav_usr_name.Text;


            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a1", view_req_detail.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            //sessions


            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    if (usertype == "admin")
                        Response.Redirect("req_full_detail_admin.aspx");
                    else if (usertype == "fyp")
                        Response.Redirect("req_full_detail_fyp.aspx");
                    else if (usertype == "finance")
                        Response.Redirect("req_full_detail_finance.aspx");
                    else if (usertype == "director")
                        Response.Redirect("req_full_detail_director.aspx");
                }


            }

            cmd.Dispose();       
        conn.Close();
    }
    protected void logout_button(object sender, EventArgs e)
    {
        nav_usr_name.Text = "";
        Response.Redirect("login.aspx");
    }
    

    protected void drop_down_req_menu_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();

        string query = "";

        string chck = drop_down_req_menu.SelectedValue.ToUpper();

        if (usertype == "admin")
        {
            if (drop_down_req_menu.SelectedValue.ToUpper() == "PENDING") { query = "select * from request where rstatus='pending' "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "PROCESSED") { query = "select * from request where rstatus='processed'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "APPROVED") { query = "select * from request where decision_fyp='approved' and decision_finance='approved' and degree_issued='NO'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "REJECTED") { query = "select * from request where decision_fyp='rejected' OR decision_finance='rejected' and degree_issued='NO'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "OBJECTION") { query = "select * from request where  decision_fyp='objection' OR decision_finance='objection' and degree_issued='NO' "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "ALLREQ") { query = "select * from request where degree_issued='NO'"; }
        }
        else if (usertype == "fyp")
        {
            if (drop_down_req_menu.SelectedValue.ToUpper() == "PENDING") { query = "select * from request where rstatus='pending' and track='FYP'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "PROCESSED") { query = "select * from request where rstatus='processed' and FYP_ID=@a1 "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "APPROVED") { query = "select * from request where  decision_fyp='approved' and Fyp_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "REJECTED") { query = "select * from request where  decision_fyp='rejected' and Fyp_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "OBJECTION") { query = "select * from request where  decision_fyp='objection' and Fyp_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "ALLREQ") { query = "select * from request where fyp_id=@a1 or track='fyp'"; }
        }
        else if (usertype == "finance")
        {
            if (drop_down_req_menu.SelectedValue.ToUpper() == "PENDING") { query = "select * from request where rstatus='pending' and track='Finance' "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "PROCESSED") { query = "select * from request where rstatus='processed' and finance_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "APPROVED") { query = "select * from request where decision_finance='approved' and finance_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "REJECTED") { query = "select * from request where decision_finance='rejected' and finance_ID=@a1"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "OBJECTION") { query = "select* from request where decision_finance = 'objection' and finance_ID = @a1";  }
           else if (drop_down_req_menu.SelectedValue.ToUpper() == "ALLREQ") { query = "select * from request where finance_id=@a1 or track='finance'"; }
        }
        else if (usertype == "director")
        {
            if (drop_down_req_menu.SelectedValue.ToUpper() == "PENDING") { query = "select * from request where rstatus='pending'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "PROCESSED") { query = "select * from request where rstatus='processed'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "APPROVED") { query = "select * from request where decision_fyp='approved' and decision_finance='approved'"; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "REJECTED") { query = "select * from request where  decision_fyp='rejected' OR decision_finance='rejected' "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "OBJECTION") { query = "select * from request where  decision_fyp='objection' OR decision_finance='objections'  "; }
            else if (drop_down_req_menu.SelectedValue.ToUpper() == "ALLREQ") { query = "select * from request"; }
        }
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

}