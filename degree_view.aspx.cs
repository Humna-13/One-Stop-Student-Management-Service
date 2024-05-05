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

public partial class degree_view : System.Web.UI.Page
{
    public string id = "", usertype = "", page = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usertype"] != null)
            usertype = Session["usertype"].ToString();
        if (Session["id"] != null)
            id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();


        string query = "select * from degree d inner join student s on d.studentid=s.id  where studentid ='12345'";

        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);

        SqlDataReader dr = cmd.ExecuteReader();
        
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                name_of_deg_label.Text = dr["sname"].ToString().ToUpper();
                cert_deg_lable.Text = dr["degree"].ToString().ToUpper();
                location_deg_label.Text = dr["locationname"].ToString().ToUpper();
                date_deg_label.Text = dr["issued_date"].ToString().ToUpper();
                
            }
        }
        
    }
}