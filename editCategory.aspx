<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="editCategory.aspx.cs" Inherits="editCategory" %>

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
                  <h6 class="m-0 font-weight-bold text-primary">Edit Category</h6>
                  
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">

                            <asp:GridView CssClass="table" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="None">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="CODE" ReadOnly="True" SortExpression="id" />
                                    <asp:TemplateField HeaderText="NAME" SortExpression="cat_name">
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("cat_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("cat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_bookstore %>" DeleteCommand="DELETE FROM [tbl_category] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_category] ([id], [cat_name]) VALUES (@id, @cat_name)" SelectCommand="SELECT * FROM [tbl_category]" UpdateCommand="UPDATE [tbl_category] SET [cat_name] = @cat_name WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="id" Type="Decimal" />
                                    <asp:Parameter Name="cat_name" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="cat_name" Type="String" />
                                    <asp:Parameter Name="id" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-3"></div>
                  </div>
                </div>
              </div>
            </div>

       
          </div>


        </div>
</asp:Content>

