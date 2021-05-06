<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="listProducts.aspx.cs" Inherits="listProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="container-fluid">
         <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
             <div class="col-xl-3 col-lg-3">
             <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Select Category</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                     
                        <div class="col-md-12">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="id"></asp:DropDownList>
                            
                      
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT * FROM [tbl_category]"></asp:SqlDataSource>
                            
                      
                        </div>
                   
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xl-9 col-lg-9">
             <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Products</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2">
                        <AlternatingItemTemplate>
                              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"><%# Eval("productname") %></h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                        <div class="col-md-3">
                            <asp:Image CssClass="productImgSize" ID="Image1" ImageUrl='<%# "~/images/"+ Eval("pro_img1") %>'  runat="server" />
                        </div>
                        <div class="col-md-9">
                           
                       
                        <p class="productDesc"><%# Eval("productdescription") %> </p>
                            <p>ISBN :<%# Eval("product_code") %></p>
                     <p>
                             <b>Price: <%# Eval("product_price") %></b>
                         <asp:LinkButton OnClick="addToCart" CommandArgument='<%# Eval("id") %>'  style="float:right" CssClass="btn btn-info btn-icon-split" ID="LinkButton1" runat="server">
                             <span class="icon text-white-50">
                      <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Add To Cart</span>
                         </asp:LinkButton>

                        
                    
                  
                         </p>
                        </div>

                  </div>
                </div>
              </div>
                        </AlternatingItemTemplate>
                
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
              
                        <ItemTemplate>
                            
                     <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"><%# Eval("productname") %></h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                        <div class="col-md-3">
                            <asp:Image CssClass="productImgSize" ID="Image2" ImageUrl='<%# "~/images/"+ Eval("pro_img1") %>'  runat="server" />
                        </div>
                        <div class="col-md-9">
                      
                       
                        <p class="productDesc"><%# Eval("productdescription") %> </p>
                            <p>ISBN :<%# Eval("product_code") %></p>
                     <p>
                             <b>Price: <%# Eval("product_price") %></b>
                         <asp:LinkButton OnClick="addToCart" CommandArgument='<%# Eval("id") %>'  style="float:right" CssClass="btn btn-info btn-icon-split" ID="LinkButton2" runat="server">
                             <span class="icon text-white-50">
                      <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Add To Cart</span>
                         </asp:LinkButton>

                        
                    
                  
                         </p>
                        </div>

                  </div>
                </div>
              </div>
                    
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
             

                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT tbl_products.prod_category_id, tbl_products.id, tbl_products.productname, tbl_products.productdescription, tbl_category.cat_name, tbl_products.product_price, tbl_products.product_code, tbl_products.pro_img1, tbl_products.pro_img2 FROM tbl_category INNER JOIN tbl_products ON tbl_category.id = tbl_products.prod_category_id WHERE (tbl_products.prod_category_id = @par1)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="par1" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
              </div>
            </div>

       
          </div>


        </div>


        </div>
</asp:Content>

