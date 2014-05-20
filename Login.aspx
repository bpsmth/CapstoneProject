<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="container"><br /><br /><br />
        <div class="col-md-8 col-md-offset-3">
            <asp:Login ID="Login1" runat="server">
                <LayoutTemplate>
                    
      <div class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
           <asp:TextBox ID="UserName" CssClass="form-control" placeholder="User Name" autofocus runat="server"></asp:TextBox> 
           <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
        <label class="checkbox">
          <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
        </label>
          <asp:Literal ID="FailureText" runat="server"  EnableViewState="False"></asp:Literal><br />
          <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*User Name is required.</asp:RequiredFieldValidator><br />
          <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*Password is required</asp:RequiredFieldValidator> <br /> 
          <asp:Button CssClass="btn btn-lg btn-primary btn-block" ID="LoginButton" runat="server" CommandName="Login" Text="Sign In" ValidationGroup="Login1" />
      </div>   
                </LayoutTemplate>
            </asp:Login>
            </div>
          </div>
    
</asp:Content>

