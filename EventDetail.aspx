<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EventDetail.aspx.vb" Inherits="EventDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
    <div class="container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="EventID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><i class="glyphicon glyphicon-calendar"></i> Event Details</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Image ID="Image2" CssClass="img-responsive" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                                </div>
                                <div class="col-md-9">
                                    <h1><asp:Label ID="Label1" runat="server" Text='<%# Bind("Expr1") %>' />
                                <span class="badge">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expr2") %>' />
                                </span>
                            </h1>
                            <h3> <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:D}")%></h3>
                            <h4><%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:hh:mm tt}")%> - <%# DataBinder.Eval(Container.DataItem, "EndTime", "{0:hh:mm tt}")%></h4>
                                <em><%# Container.DataItem("name") %></em>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><br />
                                    <strong>Description:</strong>
                                    <p><%# Container.DataItem("Description") %></p>
                                </div>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
            <br /><br>
        </ItemTemplate>
    </asp:FormView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT Events.EventID, Events.PersonID, Events.LocationID, Events.StartTime, Events.EndTime, Location.Name, Location.Category, Person.Name AS Expr1, Person.Description, Person.Hometown, Person.imagename, Person.imagepath, Person.Category AS Expr2, Person.Type FROM Events INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID WHERE ([EventID] = @EventID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EventID" QueryStringField="EventID" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

