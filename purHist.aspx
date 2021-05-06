<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="purHist.aspx.cs" Inherits="purHist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                  <h6 class="m-0 font-weight-bold text-primary">Purchase History</h6>
                    
                </div>
                <!-- Card Body -->
                <div class="card-body">

                    
                    <asp:GridView CssClass="table" ID="GridView1" GridLines="None" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Show Items" ShowSelectButton="True" />
                            <asp:BoundField DataField="billid" HeaderText="billid" SortExpression="billid" />
                            <asp:BoundField DataField="purdate" HeaderText="purdate" SortExpression="purdate" />
                            <asp:BoundField DataField="shippingaddress" HeaderText="shippingaddress" SortExpression="shippingaddress" />
                            <asp:BoundField DataField="typeofpayement" HeaderText="typeofpayement" SortExpression="typeofpayement" />
                        </Columns>
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT [billid], [purdate], [shippingaddress], [typeofpayement] FROM [tbl_bill]  where userid=@userid order by purdate desc">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </div>
                  <div class="card-footer text-muted">
                                      </div>
              </div>

               

              
             
            </div>
               <div class="col-xl-2 col-lg-2">
       
            </div>

       
          </div>
           

        </div>
</asp:Content>

