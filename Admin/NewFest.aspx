<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="NewFest.aspx.vb" Inherits="Admin_NewFest" %>

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
                        <asp:DetailsView ID="DetailsView1" CellPadding="20" InsertRowStyle-Width="100%" GridLines="None" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="festivalID">
                            <Fields>
                                <asp:TemplateField HeaderText="name" SortExpression="name">
                                    <InsertItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="current" SortExpression="current">
                                    <InsertItemTemplate>
                                        <asp:CheckBox ID="CheckBox1"  runat="server" Checked='<%# Bind("current") %>' />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="year" SortExpression="year">
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("year") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="LinkButton1" CssClass="btn btn-primary"  runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:Button>
                                        &nbsp;<asp:Button ID="LinkButton2" CssClass="btn btn-danger"  runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="LinkButton1" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        
                    </div>
                </div>
            </div>
        <br />
        <a class="btn btn-primary" href="Festivals.aspx" role="button">Back</a>
    </div>
</asp:Content>

