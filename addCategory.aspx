<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="addCategory.aspx.cs" Inherits="addCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"> Category</h1>
            </div>

    

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Add Category</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            
                         <table class="table">
                            <tr><td>Category Id</td><td>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                                 <tr><td>Category Name</td><td>
                                    
                                     <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 

                                         ErrorMessage="*" Display="Dynamic" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
ErrorMessage="Enter Characters Only" Display="Dynamic"  Forecolor="Red" ControlToValidate="TextBox1"
        ValidationExpression="^[a-zA-Z'.]{1,40}$">Enter Characters Only</asp:RegularExpressionValidator>
                                     <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Category already exist" Visible="False"></asp:Label>
                            </td></tr>
                                 <tr><td colspan="2">
                                     <asp:Button CssClass="form-control btn btn-primary" ID="Button1" runat="server" Text="ADD" OnClick="Button1_Click1" />
                                     </td></tr>
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

