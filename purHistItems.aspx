<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="purHistItems.aspx.cs" Inherits="purHistItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
         <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
             <div class="col-xl-2 col-lg-2">
                    
            </div>

            <div class="col-xl-8 col-lg-8">
                 
                <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Purchase Items List</h6>
                    
                </div>
                <!-- Card Body -->
                
                <div id="billBody" class="card-body">
                    <p><span>Bill Id:
                        <asp:Label ID="LabelBId" runat="server" Text="Label"></asp:Label>
                       </span></p>
                    <p><span>Purchase Date: 
                        <asp:Label ID="LabelPd" runat="server" Text="Label"></asp:Label></span> <span class="float-right">Payement Mode:
                        <asp:Label ID="LabelPm" runat="server" Text="Label"></asp:Label></span> </p>
                    <p>Shipping Address: <asp:Label ID="LabelSa" runat="server" Text="Label"></asp:Label></p>
             
                    


                    <asp:GridView ID="GridView1" GridLines="None" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="CODE" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="CODE" HeaderText="CODE" ReadOnly="True" SortExpression="CODE" />
                            <asp:BoundField DataField="PRODUCTNAME" HeaderText="PRODUCTNAME" SortExpression="PRODUCTNAME" />
                            <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                            <asp:BoundField DataField="SKUCODE" HeaderText="SKUCODE" SortExpression="SKUCODE" />
                            <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" SortExpression="QUANTITY" />
                            <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" />
                        </Columns>
                    </asp:GridView>
                    <p><span class="float-right mr-3">Total :<asp:Label ID="LabelTo" runat="server" Text="Label"></asp:Label>Rs</span></p>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT tbl_products.id AS CODE, tbl_products.productname AS PRODUCTNAME, tbl_products.product_price AS PRICE, tbl_products.product_code AS SKUCODE, tbl_bill_items.qty AS QUANTITY, tbl_bill_items.total AS TOTAL FROM tbl_bill INNER JOIN tbl_bill_items ON tbl_bill.billid = tbl_bill_items.billid INNER JOIN tbl_products ON tbl_bill_items.prodid = tbl_products.id WHERE (tbl_bill.userid = @userid) AND (tbl_bill.billid = @billid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" />
                            <asp:QueryStringParameter Name="billid" QueryStringField="bid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                  <div class="card-footer text-muted">

                      <button class="btn btn-primary hidden-print float-lg-right" onclick="printDiv('billBody')"> <i class="fas fa-print fa-sm fa-fw mr-2 text-gray-400"></i>  Print</button>
                                      </div>
              </div>

               

              
             
            </div>
               <div class="col-xl-2 col-lg-2">
       
            </div>

       
          </div>
           

        </div>
</asp:Content>

