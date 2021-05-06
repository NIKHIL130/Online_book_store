<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginreg.aspx.cs" Inherits="loginreg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
    <body>
 <form id="form1" runat="server">
        <div class="jumbotron"></div>
        <div class="row">
           
            <div class="col-md-4"></div>
            
            <div class="col-md-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#login" role="tab" aria-controls="home" aria-selected="true">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#registration" role="tab" aria-controls="profile" aria-selected="false">Registration</a>
                    </li>

                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="home-tab">
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="Username"  CssClass="form-control"  ID="TextBox1" runat="server" BackColor="White" BorderColor="#000099" ForeColor="Black"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="login" Display="Dynamic" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Please enter username" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Visible="false" Display="Dynamic" ErrorMessage="please enter only letters" ValidationExpression=" /^[A-Za-z0-9 ]$/" ControlToValidate="TextBox1" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="Password" TextMode="Password" SetFocusOnError="True" CssClass="form-control" ID="TextBox2" runat="server" BackColor="White" BorderColor="#000099" MaxLength="12"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="login" Display="Dynamic" ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*">

                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:Label ID="Label4" runat="server" Visible="false" ForeColor="Red" Text="Invalid User"></asp:Label>
                            <asp:Button  CssClass="form-control btn-primary" ValidationGroup="login" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />

                        </div>
                        <div align="center">
                            <asp:Button  CssClass="form-control" ID="Button3" runat="server" Text="Forgot Password" OnClick="Button3_Click" />

                        </div>
                        

                    </div>

                    <div class="tab-pane fade" id="registration" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="Username" SetFocusOnError="True" CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registration" Display="Dynamic" ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Please enter username">

                            </asp:RequiredFieldValidator>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text="Username Already Exist"></asp:Label>
                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="password"  MinLenght="8" TextMode="Password" CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registration" Display="Dynamic" ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="*">

                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder=" Renter password" TextMode="Password" CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registration" Display="Dynamic" ControlToValidate="TextBox5" ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="*">

                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ControlToCompare="TextBox4" ControlToValidate="TextBox5" Display="Dynamic" ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch"></asp:CompareValidator>

                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="Email Address" CssClass="form-control" ID="TextBox6" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registration" Display="Dynamic" ControlToValidate="TextBox6" ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="*">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox6" runat="server" ErrorMessage="Invalid Phone No"></asp:RegularExpressionValidator>
                            </asp:RequiredFieldValidator>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text="Email Already Exist"></asp:Label>

                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:TextBox placeholder="Phone Number" CssClass="form-control" ID="TextBox7" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registration" Display="Dynamic" ControlToValidate="TextBox7" ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="*">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ValidationExpression="\d{10}" ControlToValidate="TextBox6" runat="server" ErrorMessage="Invalid Email"></asp:RegularExpressionValidator>
                            </asp:RequiredFieldValidator>
                            <asp:Label ID="Label3" runat="server" Visible="false" Text="Email Already Exist"></asp:Label>

                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:Button CssClass="form-control btn-primary" OnClick="Button2_Click" ValidationGroup="Register" ID="Button2" runat="server" Text="Register" />

                        </div>


                    </div>


                </div>
            </div>
            <div class="col-md-4"></div>
           
        </div>

    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
    </html>