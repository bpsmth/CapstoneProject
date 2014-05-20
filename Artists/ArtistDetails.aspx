<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ArtistDetails.aspx.vb" Inherits="artistdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([PersonID] = @PersonID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PersonID" QueryStringField="PersonID" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.StartTime, Events.EndTime, Location.LocationID AS Expr1, Location.Name, Location.Category, Festival.name AS Expr2, Festival.year FROM Events INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Festival ON Events.FestivalID = Festival.festivalID WHERE ([PersonID] = @PersonID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="PersonID" QueryStringField="PersonID" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>

  <br /><br /><br /><br />
    <div class="container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PersonID" DataSourceID="SqlDataSource1">
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
                </div>
            </div><br /><br>
        </ItemTemplate>
    </asp:FormView>
        <div class="row">
            <div class="col-md-12">
                <h2>Upcoming Events</h2>
            </div>
        </div>
         <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="Festival" SortExpression="Expr2">
                        <ItemTemplate>
                            <%# Container.DataItem("Expr2")%> - <%# Container.DataItem("year") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                        <ItemTemplate>
                             <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:D}")%><br />
                             <em><%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:hh:mm tt}")%></em>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EndTime", "{0:D}")%><br />
                             <em><%# DataBinder.Eval(Container.DataItem, "EndTime", "{0:hh:mm tt}")%></em>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Location" SortExpression="Name" />    
                </Columns>
                        <EmptyDataTemplate>
                            <h3>Sorry this Person has no upcoming events</h3>
                        </EmptyDataTemplate>
            </asp:GridView>


   </div>
            </div>
        </div>
    </div>
   

</asp:Content>

