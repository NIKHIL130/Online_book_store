<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="addProduct.aspx.cs" Inherits="addProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Product</h1>
            </div>

    

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Add Product</h6>

                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                                                        
                         <table class="table">
                                      <tr><td>Product Id</td><td>
                                          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                          </td></tr>
                                      <tr><td>Product Name</td><td>
                                          
                                          <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Product Already Available in Category" Visible="False"></asp:Label>
                                          </td></tr>
                                      <tr><td>Product Description</td><td>
                                          <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                                          </td></tr>
                                      <tr><td>Select Category</td><td>
                                          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="id">
                                          </asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" SelectCommand="SELECT * FROM [tbl_category]"></asp:SqlDataSource>
                                          </td></tr>
                                      <tr><td>Product Price</td><td>
                                          <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="*" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                                          </td></tr>
                                      <tr><td>Product Code</td><td>
                                          <asp:TextBox ID="TextBox4" Minlength="10" MaxLength="13" runat="server" CssClass="form-control" BorderStyle="Solid"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ControlToValidate="TextBox4" ForeColor="Red" ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+" ErrorMessage="please enter only numbers"></asp:RegularExpressionValidator>
                                          </td></tr>
                             
                                      <tr><td>Select Image 1</td><td>
                                          <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ErrorMessage="*" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                                          </td></tr>
                                      <tr><td>Select Image 2</td><td>
                                          <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                          </td></tr>
                                      <tr><td colspan="2">
                                          <asp:Button ID="Button1" runat="server" Text="ADD" CssClass="form-control btn btn-primary" OnClick="Button1_Click" /></td></tr>
                        </table>
                        </div>
                        <div class="col-md-3"></div>
                  </div>
                </div>
              </div>
            </div>

       
          </div>


        </div>
</asp:Content>

