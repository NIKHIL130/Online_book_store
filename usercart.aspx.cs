using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class usercart : System.Web.UI.Page
{
    db d = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("loginreg.aspx");

        }
        else
        {
            updateTotal();

        }
    }
    public void updateTotal()
    {
        string data = d.getSingleRow("select SUM(total) from tbl_cart where userid=" + Session["userid"]);


        if (data.Split(':')[0] == "")
        {
            Label1.Text = "0";
            Button1.Enabled = false;

        }
        else
        {
            Label1.Text = data.Split(':')[0];
            Button1.Enabled = true;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }









    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cidandcost = ((DropDownList)sender).ToolTip.ToString();
        string[] alldt = cidandcost.Split(':');

        int qty = Convert.ToInt32(((DropDownList)sender).Text);
        int cost = Convert.ToInt32(alldt[0]);
        int cid = Convert.ToInt32(alldt[1]);
        if (qty == 0)
        {
            d.deleteData("delete from tbl_cart where id=" + cid);

            GridView1.DataBind();
            updateTotal();




        }
        else
        {

            int tot = qty * cost;
            d.updateData("update tbl_cart set qty=" + qty + ", total= " + tot + " where id=" + cid);
            GridView1.DataBind();
            updateTotal();


        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Button1.Visible = false;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {


       
        string nameShip = "Name: " + TextBox3.Text+" ,";
        nameShip += "ADDRESS:"+TextBox4.Text + " ,";
        nameShip += TextBox5.Text + " ,";
        nameShip += TextBox6.Text + " ,";
        nameShip += TextBox7.Text + " ,";
        nameShip += TextBox8.Text + " ,";
        nameShip +="PHONE NO:" + TextBox9.Text + " ,";
        string paymode = DropDownList2.SelectedValue;
        string billid = d.latestId("tbl_bill", "billid");
        string insertbill = "insert into tbl_bill values(" + billid + "," + Session["userid"] + ",GETDATE(),'" + nameShip + "','" + paymode + "')";

        d.insertData(insertbill);
        DataSet cartdt = d.selectData("select * from tbl_cart where userid=" + Session["userid"] + "");
        for (int i = 0; i < cartdt.Tables[0].Rows.Count; i++)
        {
            string billitems = "insert into tbl_bill_items values(" + d.latestId("tbl_bill_items", "id") + "," + billid + "," + cartdt.Tables[0].Rows[i][2] + "," + cartdt.Tables[0].Rows[i][3] + "," + cartdt.Tables[0].Rows[i][4] + ")";
            d.insertData(billitems);
           
        }
        d.deleteData("delete from tbl_cart where userid=" + Session["userid"]);
        Response.Write("<script type='text/javascript'>alert('You have successfully purchased an item')</script>");






    }
}