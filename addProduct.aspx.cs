using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addProduct : System.Web.UI.Page
{
    db d = new db();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = d.latestId("tbl_products", "id");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string data = d.getSingleRow("select * from tbl_products where productname='" + TextBox1.Text + "' and prod_category=" + DropDownList1.SelectedValue + "");

        if (data.Length == 0)
        {

            Label2.Visible = true;
            string prodid = d.latestId("tbl_products", "id");
            string img1 = Server.MapPath("") + "\\images\\img-" + prodid + "-1.jpg";
            string img2 = Server.MapPath("") + "\\images\\img-" + prodid + "-2.jpg";
            FileUpload1.SaveAs(img1);
            FileUpload2.SaveAs(img2);
            d.insertData("insert into tbl_products values(" + prodid + ",'" + TextBox1.Text + "','" + TextBox2.Text + "'," + DropDownList1.SelectedValue + "," + TextBox3.Text + ",'" + TextBox4.Text + "','img-" + prodid + "-1.jpg','img-" + prodid + "-2.jpg')");
            Response.Write("addProduct.aspx");
            Response.Write("<script type='text/javascript'>alert('Product added')</script>");
        }

        else
        {
            Label2.Visible = true;

        }
    }
}