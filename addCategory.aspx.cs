using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addCategory : System.Web.UI.Page
{
    db d = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = d.latestId("tbl_category", "id");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (d.checkAvailablity("tbl_category", "cat_name", TextBox1.Text))
        {
            Label2.Visible = true;

        }
        else
        {
            Label2.Visible = false;
            d.insertData("insert into tbl_category values(" + d.latestId("tbl_category", "id") + ",'" + TextBox1.Text + "')");
            Response.Redirect("addCategory.aspx");

        }
    }
}