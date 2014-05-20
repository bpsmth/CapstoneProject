<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Artists.aspx.vb" Inherits="viewartists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br />
        <div class="container">
        <div class="col-md-8 col-md-offset-2">
            <div class="row">
                <div class="input-group input-group-lg">
                     <asp:TextBox ID="tbSearch" AutoPostBack="true" Placeholder="Search by name" CssClass="form-control" runat="server"></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default"  Text="Search" />
                    </span>
                    
                </div>
                <br /><br />
            </div>
        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="table-responsive">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([Type] = @Type)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Artist" Name="Type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" gridlines="None" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PersonID" DataSourceID="SqlDataSource1" AllowPaging="true" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Image" SortExpression="imagepath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imagepath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Hometown" HeaderText="Hometown" SortExpression="Hometown" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:HyperLinkField DataNavigateUrlFields="personID" DataNavigateUrlFormatString="~/Artists/artistdetails.aspx?personID={0}" NavigateUrl="~/artistdetails.aspx" Text="View Details" />
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

