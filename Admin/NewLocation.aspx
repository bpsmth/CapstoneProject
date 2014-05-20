<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="NewLocation.aspx.vb" Inherits="Admin_NewLocation" %>

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
                        <asp:DetailsView ID="DetailsView1" runat="server" GridLines="None"  DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="LocationID">
                            <Fields>
                                <asp:TemplateField HeaderText="Name:" SortExpression="Name">
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category:" SortExpression="Category">
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:Button>
                                        &nbsp;<asp:Button ID="LinkButton2" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                    </InsertItemTemplate>
                                    <ItemTemplate>

                                        <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        
                    </div>
                </div>
            </div>
        <br />
            <a class="btn btn-primary" href="Locations.aspx" role="button">Back</a>
    </div>
</asp:Content>

