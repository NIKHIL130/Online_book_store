using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user : System.Web.UI.MasterPage
{
    db d = new db();

    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["userid"] == null)
        {
            Label1.Text = "Guest";
           
            LinkButton2.Visible = false;
            LinkButton3.Visible = false;
            LinkButton4.Visible = true;
            LinkButton5.Visible = true;
            LinkButton6.Visible = false;




        }
        else
        {
            Label1.Text = Session["username"].ToString();
           
            LinkButton2.Visible = true;
            LinkButton3.Visible = true;
            LinkButton4.Visible = false;
            LinkButton5.Visible = false;
            LinkButton6.Visible = true;


        }
    }

    protected void logout(object sender, EventArgs e)
    {
        Session["userid"] = null;
        Session["username"] = null;
        Session.Abandon();
        Response.Redirect("loginreg.aspx");

    }
    protected void LoginReg(object sender, EventArgs e)
    {
        Response.Redirect("loginreg.aspx");
    }
}
