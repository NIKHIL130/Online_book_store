using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listProducts : System.Web.UI.Page
{
    db d = new db();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addToCart(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("loginreg.aspx");

        }
        else
        {
            string pid = ((LinkButton)sender).CommandArgument.ToString();
            string checkproductincart = d.getSingleRow("select * from tbl_cart where prodid=" + pid);
            if (checkproductincart.Length == 0)
            {
                string data = d.getSingleRow("select product_price from tbl_products where id=" + pid);
                string[] opdata = data.Split(':');
                string price = opdata[0];
                d.insertData("insert into tbl_cart values(" + d.latestId("tbl_cart", "id") + "," + Session["userid"] + "," + pid + ",1," + price + ")");
                Response.Write("<script type='text/javascript'>alert('Product added to cart')</script>");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Product already in cart')</script>");
            }



        }

    }
}