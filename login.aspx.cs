using System.Windows.Forms;
using System;
using System.Web;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Threading;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        chck_valid.Text="";

    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string user_id = id.Text;
            string user_pass = password.Text;
            string person = login_choice_dropdown.Text;
            bool user_chck = false, pass_chck = false;


            if (user_approval(user_id, user_pass, ref user_chck, ref pass_chck))
            {
                Session["usertype"] = person;
                Session["id"] = user_id;
                if (person == "student")
                    Response.Redirect("student_main_page.aspx");
                else if (person == "fyp")
                    Response.Redirect("~/fyp_main_page.aspx");
                else if (person == "admin")
                    Response.Redirect("~/admin_main_page.aspx");
                else if (person == "director")
                    Response.Redirect("~/director_main_page.aspx");
                else if (person == "finance")
                    Response.Redirect("~/finance_main_page.aspx");

            }
            else
            {
                if (user_chck == false)
                    chck_valid.Text = "*User Not found";
                else if (pass_chck == false)
                    chck_valid.Text = "*Password Incorrect";


            }

            clear_strings();
        }
    }
    bool user_approval(string user_id, string user_pass,ref bool user_chck,ref bool pass_chck)
    {
        
        bool found = false;
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        
        string query = "";
        if (login_choice_dropdown.Text == "student")
            query = "select id, passwords from student";
        else if (login_choice_dropdown.Text == "fyp")
            query = "select id, passwords from fyp";
        else if (login_choice_dropdown.Text == "admin")
            query = "select id, passwords from admin";
        else if (login_choice_dropdown.Text == "director")
            query = "select id, passwords from director";
        else if (login_choice_dropdown.Text == "finance")
            query = "select id, passwords from finance";


       // SqlCommand cm = new SqlCommand("select email,paswords from'" + curr_table+ "' where email='" + user_id + "' and paswords='" + user_pass + "'", conn);
        SqlCommand cm = new SqlCommand(query, conn);
        cm.Parameters.AddWithValue("@a2", user_id);
        cm.Parameters.AddWithValue("@a3", user_pass);
        SqlDataReader reader = cm.ExecuteReader();
        while (reader.Read())
        {

            if (reader["id"].ToString().ToUpper() == user_id.ToUpper() &&
                reader["passwords"].ToString().ToUpper() == user_pass.ToUpper())
            {
                user_chck = true;
                pass_chck = true;
                found = true;

            }
            else if (reader["id"].ToString().ToUpper() == user_id.ToUpper() &&
                reader["passwords"].ToString().ToUpper() != user_pass.ToUpper())
            {
                user_chck = true;
                pass_chck = false;
                found = false;
            }
            else if (reader["id"].ToString().ToUpper() != user_id.ToUpper() &&
                reader["passwords"].ToString().ToUpper() == user_pass.ToUpper())
            {
                user_chck = false;
                pass_chck = true;
                found = false;
            }
        }
        return found;

    }
    protected void model_TextChanged(object sender, EventArgs e)
    {      
       
    }


    protected void clear_strings()
    {
        
        password.Text = "";
    

    }
}
