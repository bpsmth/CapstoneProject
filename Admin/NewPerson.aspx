<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="NewPerson.aspx.vb" Inherits="Admin_NewPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" DeleteCommand="DELETE FROM [Person] WHERE [PersonID] = @PersonID" InsertCommand="INSERT INTO [Person] ([Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type]) VALUES (@Name, @Description, @Hometown, @imagename, @imagepath, @Category, @Type)" SelectCommand="SELECT * FROM [Person]" UpdateCommand="UPDATE [Person] SET [Name] = @Name, [Description] = @Description, [Hometown] = @Hometown, [imagename] = @imagename, [imagepath] = @imagepath, [Category] = @Category, [Type] = @Type WHERE [PersonID] = @PersonID">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT DISTINCT [Type] FROM [Person]"></asp:SqlDataSource>
    
    <br />
    <br />
    <br />
    <br />
    <div class="container">
                    <div class="row">
                        <asp:Label ID="NotifyLbl" runat="server" Text=""></asp:Label> 

                    </div>
                    <div class="row">
                    <div class="form-group">
                        <label class="control-label">Name:</label>
                        <asp:TextBox ID="NameTb" CssClass="form-control" runat="server" Text= '<%# Bind("Name") %>' ></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="NameTb" ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="Name required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        
                    <label class="control-label">Type:</label><asp:DropDownList ID="catDrop" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="Type" DataValueField="Type" ></asp:DropDownList>
                            
                    </div>
                    <div class="form-group">
                        <label class="control-label">Category:</label>
                        <asp:Textbox ID="CatTb" runat="server" CssClass="form-control" Text='<%# Bind("Category") %>' ForeColor="Black" />
                        <asp:RequiredFieldValidator ControlToValidate="CatTb" ID="RequiredFieldValidator9" runat="server" ForeColor="Red" ErrorMessage="Category required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Hometown:</label>
                        <asp:TextBox ID="HomeTb" CssClass="form-control" runat="server" Text='<%# Bind("Hometown") %>' />
                        <asp:RequiredFieldValidator ControlToValidate="HomeTb" ID="RequiredFieldValidator10" runat="server" ForeColor="Red" ErrorMessage="Hometown required"></asp:RequiredFieldValidator>
                                
                    </div>
                    <div class="form-group">
                        <label class="control-label">Upload Image:</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                     </div>
                    <div class="form-group">
                        <label class="control-label">Description:</label>
                        <asp:TextBox ID="DescTb" CssClass="form-control" runat="server" Text='<%# Bind("Description")%>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="DescTb" ID="RequiredFieldValidator11" runat="server" ForeColor="Red" ErrorMessage="Description required"></asp:RequiredFieldValidator> 
                    </div>
                    <div class="form-group">
                         <asp:Button ID="InsertBtn" CssClass="btn btn-primary"  runat="server" CausesValidation="True" CommandName="Insert" Text="Add Person"></asp:Button>
                         <asp:Button ID="CancelBtn" CssClass="btn btn-primary" OnClick="CancelBtn_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                         
                    </div>
                </div>
            </div>
       




      
    


</asp:Content>

