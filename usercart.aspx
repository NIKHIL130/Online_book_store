<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="usercart.aspx.cs" Inherits="usercart" %>

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
                  <h6 class="m-0 font-weight-bold text-primary">Cart</h6>
                    <h6 class="m-0 font-weight-bold text-primary float-right">TOTAL
                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label> Rs</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="prodid" HeaderText="prodid" SortExpression="prodid" Visible="False" />
                            <asp:BoundField DataField="productname" HeaderText="NAME" SortExpression="productname" />
                            <asp:BoundField DataField="productdescription" HeaderText="DETAIL" SortExpression="productdescription" Visible="False" />
                            <asp:BoundField DataField="product_price" HeaderText="PRICE" SortExpression="product_price" />
                            <asp:BoundField DataField="product_code" HeaderText="CODE" SortExpression="product_code" />
                            <asp:TemplateField HeaderText="PREVIEW" SortExpression="pro_img1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pro_img1") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    
                                    <asp:Image ID="Image1" runat="server" CssClass="cartImg" ImageUrl='<%# "images/"+ Eval("pro_img1") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QUANTITY" SortExpression="qty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" 
                                         ToolTip='<%# Eval("product_price") +":"+ Eval("id")%>'
                                        SelectedValue='<%# Eval("qty") %>' CssClass="form-control">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="total" HeaderText="TOTAL" SortExpression="total" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT tbl_cart.id, tbl_cart.prodid, tbl_products.productname, tbl_products.productdescription, tbl_products.product_price, tbl_products.product_code, tbl_products.pro_img1, tbl_cart.qty, tbl_cart.total FROM tbl_cart INNER JOIN tbl_products ON tbl_cart.prodid = tbl_products.id WHERE (tbl_cart.userid = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="userid" SessionField="userid" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </div>
                  <div class="card-footer text-muted">
                      <asp:Button  CssClass="btn btn-success float-right" ID="Button1" runat="server" Text="Checkout" OnClick="Button1_Click" />
                </div>
              </div>

               <asp:Panel Visible="false" ID="Panel1" CssClass="card shadow mb-4" runat="server">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Shipping Details and Payment Mode</h6>
                    <h6 class="m-0 font-weight-bold text-primary float-right"></h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="row">

                   
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <h5>Shipping address</h5>
                    <hr />
                     <asp:TextBox ID="TextBox3" placeholder="Full Name" CssClass="form-control" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox4"  placeholder="Street address, po box, company name" CssClass="form-control mt-1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox5" placeholder="apartment, building, floor, etc"  CssClass="form-control mt-1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox6" placeholder="State"  CssClass="form-control mt-1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox7" placeholder="City"  CssClass="form-control mt-1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox8" placeholder="Zipcode"  CssClass="form-control mt-1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="TextBox9" placeholder="Phone No"  CssClass="form-control mt-1" runat="server"></asp:TextBox>
                    <hr />
                      <h5>Payement Details</h5>
                    <hr />
                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">

                           <asp:ListItem Value="CASH ON DELIVERY">CASH ON DELIVERY</asp:ListItem>
                         <asp:ListItem Value="CASH ON DELIVERY">INTERNET BANKING</asp:ListItem>
                         <asp:ListItem Value="CASH ON DELIVERY">CARD PAYMENT </asp:ListItem>
                         <asp:ListItem Value="CASH ON DELIVERY">PAYTM UPI</asp:ListItem>
                    </asp:DropDownList>
                 


                </div>
                 <div class="col-md-3"></div>
 
                 </div>
               
  </div>
                  <div class="card-footer text-muted">
                      <asp:Button  CssClass="btn btn-success float-right" ID="Button2" runat="server" Text="Buy" OnClick="Button2_Click"  />
                </div>
               </asp:Panel>

              
             
            </div>
               <div class="col-xl-2 col-lg-2">
       
            </div>

       
          </div>
           

        </div>
</asp:Content>
