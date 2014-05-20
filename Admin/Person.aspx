<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Person.aspx.vb" Inherits="Admin_Person" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] ORDER BY [Type]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT DISTINCT [Type] FROM [Person] ORDER BY [Type]"></asp:SqlDataSource>
    <br /><br /><br /><br />
        <div class="container">
        <div class="col-md-12">
            <div class="row">
                <asp:Button ID="NewBtn" CssClass="btn btn-primary pull-right" OnClick="NewBtn_Click" runat="server" CausesValidation="False"  Text="Add New Person"></asp:Button><br />
            </div>
            <div class="row"><br />
                <div class="input-group input-group-lg">

                     <asp:TextBox ID="tbSearch" AutoPostBack="true" Placeholder="Search by name" CssClass="form-control" runat="server"></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default"  Text="Search" />
                    </span>
                    
                </div>
                
            </div>
            <div class="row"><br />
                <div class="col-md-4">
                    <label>Filter:</label><asp:DropDownList AutoPostBack="true" ID="catDrop" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                     
                <br />
                </div>
                <br />
                
                    
            </div>
        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="table-responsive">

    <asp:GridView ID="GridView1" gridlines="None" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PersonID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Image" SortExpression="imagepath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imagepath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" CssClass="img-responsive gridviewimages" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Hometown" HeaderText="Hometown" SortExpression="Hometown" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:HyperLinkField DataNavigateUrlFields="personID" DataNavigateUrlFormatString="~/Admin/PersonDetails.aspx?personID={0}" NavigateUrl="~/Admin/PersonDetails.aspx" Text="View Details" />
        </Columns>
        <EmptyDataTemplate>
                             <h1>Sorry, we could not find this person</h1>
        </EmptyDataTemplate>
    </asp:GridView>
    </div>
    </div>
    </div>
    </div>


</asp:Content>

