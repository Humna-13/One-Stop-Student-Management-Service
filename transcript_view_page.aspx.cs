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
public partial class transcript_view_page : System.Web.UI.Page
{
    public string id = "", usertype = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (Session["id"] != null)
            id = Session["id"].ToString();
        if (Session["username"] != null)
            nav_usr_name.Text = "Hello ! " + Session["username"].ToString();
        /*if (Session["sender_page"] != null)
            page = Session["sender_page"].ToString();*/

        string query="select max(sem_number) as max from student, transcript t, transcript_semester s where t.studentID = @a1 and Student.ID = @a1 and s.transcriptID = t.TID";
        string max ="";
        SqlConnection conn = new SqlConnection("Data Source=AYESHA\\SQLEXPRESS;Initial Catalog=se_project;Integrated Security=True");
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@a1", id);
        SqlDataReader dr= cmd.ExecuteReader();
        
        while (dr.Read())
        {
            if (dr.HasRows) { max = dr["max"].ToString();
                dr.Close();
                query = "select degree from transcript t inner join student s on  t.studentid=s.id where s.id=@a1";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@a1", id);
                dr = cmd.ExecuteReader();
                while (dr.Read()) { deg_transcript_label.Text = dr["degree"].ToString().ToUpper(); }
            }
        }

        dr.Close();

       // deg_transcript_label.Text =


        for (int j = 1; j <= Int16.Parse(max); j++)
        {
            name_transcript_label.Text =Session["username"].ToString();
            
            query = "select * from transcript t inner join transcript_semester s on t.tid=s.transcriptid where sem_number=@a1 and studentid=@a2";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@a1", j);
            cmd.Parameters.AddWithValue("@a2", "12345");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            
            if (j == 1)
            {
                
                sem1_transcript_label.Text = "Semester 1" ;
                sem1_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                grdUser1.DataSource = dt;
                grdUser1.DataBind();
              
                

                for (int i = 0; i < grdUser1.Rows.Count; i++)
                {
                     
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = grdUser1.Rows[i].Cells[1].Text;
                    

                }
            }
            else if (j == 2)
            {
                sem2_transcript_label.Text = "Semester 2";
                sem2_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                grdUser2.DataSource = dt;
                grdUser2.DataBind();
                

                for (int i = 0; i < grdUser2.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = grdUser2.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 3)
            {
                sem3_transcript_label.Text = "Semester 3";
                sem3_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView3.DataSource = dt;
                GridView3.DataBind();
                

                for (int i = 0; i < GridView3.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView3.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 4)
            {
                sem4_transcript_label.Text = "Semester 4";
                sem4_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView4.DataSource = dt;
                GridView4.DataBind();
                

                for (int i = 0; i < GridView4.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView4.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 5)
            {
                sem5_transcript_label.Text = "Semester 5";
                sem5_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView5.DataSource = dt;
                GridView5.DataBind();
                

                for (int i = 0; i < GridView5.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView5.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 6)
            {
                sem6_transcript_label.Text = "Semester 6";
                sem6_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView6.DataSource = dt;
                GridView6.DataBind();
                

                for (int i = 0; i < GridView6.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView6.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 7)
            {
                sem7_transcript_label.Text = "Semester 7";
                sem7_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView7.DataSource = dt;
                GridView7.DataBind();
                

                for (int i = 0; i < GridView7.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView7.Rows[i].Cells[1].Text;


                }
            }
            else if (j == 8)
            {
                sem3_transcript_label.Text = "Semester 8";
                sem3_sgpa_label.Text = "SGPA: " + dt.Rows[0]["gpa"].ToString();
                GridView8.DataSource = dt;
                GridView8.DataBind();
                

                for (int i = 0; i < GridView8.Rows.Count; i++)
                {
                    HtmlGenericControl div;
                    div = new HtmlGenericControl("div");
                    div.ID = "dv" + i;
                    div.InnerText = GridView8.Rows[i].Cells[1].Text;


                }
            }
            
        }
    }
}