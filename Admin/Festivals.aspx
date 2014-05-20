<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Festivals.aspx.vb" Inherits="Admin_Festivals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            
        <br /><br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" DeleteCommand="DELETE FROM [Festival] WHERE [festivalID] = @festivalID" InsertCommand="INSERT INTO [Festival] ([name], [current], [year]) VALUES (@name, @current, @year)" SelectCommand="SELECT * FROM [Festival]" UpdateCommand="UPDATE [Festival] SET [name] = @name, [current] = @current, [year] = @year WHERE [festivalID] = @festivalID">
                <DeleteParameters>
                    <asp:Parameter Name="festivalID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="current" Type="Boolean" />
                    <asp:Parameter Name="year" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="current" Type="Boolean" />
                    <asp:Parameter Name="year" Type="Int32" />
                    <asp:Parameter Name="festivalID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover fest" DataKeyNames="festivalID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                
                                <asp:BoundField DataField="festivalID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="festivalID" />
                                <asp:BoundField DataField="name" HeaderText="Festival" SortExpression="name" />
                                <asp:BoundField DataField="current" HeaderText="Current?" SortExpression="current" />
                                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                        
                    </div>
                </div>
            </div>
            <a class="btn btn-primary" href="NewFest.aspx" role="button">Add New Festival</a>
    </div>
</asp:Content>

