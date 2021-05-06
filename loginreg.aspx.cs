using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginreg : System.Web.UI.Page
{
    db d = new db();


    protected void Page_Load(object sender, EventArgs e)
    {

    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        string data = d.getSingleRow("select * from tbl_user where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'");
        if (data.Length == 0)
        {
            Label4.Visible = true;

        }
        else
        {
            string[] dtop = data.Split(':');
            Session["userid"] = dtop[0];
            Session["username"] = dtop[1];
            Session["role"] = dtop[5];
            string role = Session["role"].ToString();
            if(role == "admin")
            {
                Response.Redirect("addCategory.aspx");
            }
            else
            {
                Response.Redirect("listProducts.aspx");
            }

        }
       
    }

       


    protected void Button2_Click(object sender, EventArgs e)
    {
        if (d.checkAvailablity("tbl_user", "username", TextBox3.Text))
        {


            Label1.Visible = true;

        }
        else
        {
            Label1.Visible = false;
            if (d.checkAvailablity("tbl_user", "emailaddress", TextBox6.Text))
            {


                Label2.Visible = true;

            }
            else
            {
                Label2.Visible = false;
                d.insertData("insert into tbl_user values(" + d.latestId("tbl_user", "userid") + ",'" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + " ','user1')");
                Response.Redirect("loginreg.aspx");


            }
        }
       
    }



    protected void Button3_Click(object sender, EventArgs e)
    {
       
    }

}