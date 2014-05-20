<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="PersonDetails.aspx.vb" Inherits="Admin_Person" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([PersonID] = @PersonID)" DeleteCommand="DELETE FROM [Person] WHERE [PersonID] = @PersonID" InsertCommand="INSERT INTO [Person] ([Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type]) VALUES (@Name, @Description, @Hometown, @imagename, @imagepath, @Category, @Type)" UpdateCommand="UPDATE [Person] SET [Name] = @Name, [Description] = @Description, [Hometown] = @Hometown, [imagename] = @imagename, [imagepath] = @imagepath, [Category] = @Category, [Type] = @Type WHERE [PersonID] = @PersonID">
        <DeleteParameters>
            <asp:Parameter Name="PersonID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Hometown" Type="String" />
            <asp:Parameter Name="imagename" Type="String" />
            <asp:Parameter Name="imagepath" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="PersonID" QueryStringField="personID" Type="Decimal" DefaultValue="0" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Hometown" Type="String" />
            <asp:Parameter Name="imagename" Type="String" />
            <asp:Parameter Name="imagepath" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="PersonID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br /><br /><br /><br />
    <div class="container">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PersonID" RenderOuterTable="false" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-2">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <label class="control-label">Name:</label>
                        <asp:TextBox ID="NameTb" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Category:</label>
                         <asp:Textbox ID="CatTb" runat="server" CssClass="form-control" Text='<%# Bind("Category") %>' ForeColor="Black" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Hometown:</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("Hometown") %>' />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Description:</label>
                        <asp:TextBox ID="DescTb" CssClass="form-control" runat="server" Text='<%# Bind("Description")%>' TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                         <asp:Button ID="UpdateBtn" CssClass="btn btn-primary"  runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:Button>
                        <asp:Button ID="CancelBtn" CssClass=" btn btn-danger" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"></asp:Button>
                    </div>
                </div>
            </div>
        </EditItemTemplate>
        
        
        
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h1><asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        <span class="badge">
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category") %>' />
                        </span>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                </div>
                <div class="col-md-9">
                    <strong>Hometown:</strong> <asp:Label ID="HometownLabel" runat="server" Text='<%# Bind("Hometown") %>' />
                    <br />
                    <strong>Description:</strong> <br />
                    <p><%# Container.DataItem("Description") %></p>
                     <asp:Button ID="EditButton" runat="server" CssClass="btn btn-primary" 

            CausesValidation="False" CommandName="Edit"

            Text="Edit">
</asp:Button>
            <asp:Button ID="DeleteBtn" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:Button>            
            


                </div>

            </div>
            <br /><br>
        </ItemTemplate>
    </asp:FormView>
    </div>
</asp:Content>

