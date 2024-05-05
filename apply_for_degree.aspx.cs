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


public partial class apply_for_degree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["username"] != null)
            nav_usr_name.Text = Session["username"].ToString();

    }
    protected void Deg_submit_Button_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();


        string time = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        String strDateFormat = "dd-MM-yyyy hh:mm:ss tt";
        DateTime times = DateTime.ParseExact(time, strDateFormat, CultureInfo.InvariantCulture);


        string query = "insert into request(studentid,track,s_time,rstatus,admin_starttime,student_name,father_name,saddress,degree,email,cgpa,campus,degree_issued) values (@a2,@a4,@a5,@a7,@a11,@a20,@a21,@a22,@a23,@a24,@a25,@a26,@a27)";
       

        SqlCommand cmd1 = new SqlCommand(query, conn);

        cmd1.Parameters.AddWithValue("@a2", id.Text);
        cmd1.Parameters.AddWithValue("@a4", "admin");
        cmd1.Parameters.AddWithValue("@a5", times);
        cmd1.Parameters.AddWithValue("@a7", "Pending");
        cmd1.Parameters.AddWithValue("@a11", times);
        cmd1.Parameters.AddWithValue("@a20", name.Text);
        cmd1.Parameters.AddWithValue("@a21", fname.Text);
        cmd1.Parameters.AddWithValue("@a22", address.Text);
        cmd1.Parameters.AddWithValue("@a23", degree.Text);
        cmd1.Parameters.AddWithValue("@a24", email.Text);
        cmd1.Parameters.AddWithValue("@a25", cgpa.Text);
        cmd1.Parameters.AddWithValue("@a26", campus.Text);
        cmd1.Parameters.AddWithValue("@a27", "NO");


        int a = cmd1.ExecuteNonQuery();
        if (a > 0) {
           
            Response.Redirect("~/student_main_page.aspx");
        }
       

        
        cmd1.Dispose();
        conn.Close();

    }
     

}