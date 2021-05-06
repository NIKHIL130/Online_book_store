using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class purHistItems : System.Web.UI.Page
{
    db d = new db();
    protected void Page_Load(object sender, EventArgs e)
    {
       string pd=  d.getSingleRow("SELECT CONVERT(date,[purdate]) FROM[db_bookstore].[dbo].[tbl_bill] where billid="+ Request.QueryString["pid"]).Split(' ')[0];
       string sa = d.getSingleRow("SELECT [shippingaddress] FROM[db_bookstore].[dbo].[tbl_bill] where billid=" + Request.QueryString["bid"]);
       string pm = d.getSingleRow("SELECT [typeofpayement]FROM[db_bookstore].[dbo].[tbl_bill] where billid=" + Request.QueryString["bid"]);

        LabelPm.Text = pm.Substring(0,pm.Length - 1);
    
        LabelPd.Text= pd;
        LabelSa.Text = sa.Substring(0, sa.Length-1);
        string tot = d.getSingleRow("select  SUM(total) from dbo.tbl_bill_items where billid=" + Request.QueryString["bid"]);
        LabelTo.Text = tot.Substring(0, tot.Length - 1);
        LabelBId.Text = Request.QueryString["bid"];


}
}