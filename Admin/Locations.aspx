<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Locations.aspx.vb" Inherits="Admin_Locations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            
        <br /><br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" DeleteCommand="DELETE FROM [Location] WHERE [LocationID] = @LocationID" InsertCommand="INSERT INTO [Location] ([Name], [Category]) VALUES (@Name, @Category)" SelectCommand="SELECT * FROM [Location]" UpdateCommand="UPDATE [Location] SET [Name] = @Name, [Category] = @Category WHERE [LocationID] = @LocationID">
                <DeleteParameters>
                    <asp:Parameter Name="LocationID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter Name="LocationID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover fest" DataKeyNames="LocationID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="LocationID" HeaderText="ID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="LocationID" />
                                <asp:BoundField DataField="Name" HeaderText="Location" SortExpression="name" />
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        
                    </div>
                </div>
            </div>
            <a class="btn btn-primary" href="NewLocation.aspx" role="button">Add New Location</a>
    </div>
</asp:Content>

