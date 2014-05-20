<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Arts.aspx.vb" Inherits="Festivals_Festivals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <br /><br /><br />
            <h1>Arts Festival</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <iframe width='100%' height='500px' frameBorder='0' src='http://a.tiles.mapbox.com/v3/jreed91.hgnn9onp/attribution,zoomwheel.html'></iframe>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2>Schedule of Events</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Repeater ID="Repeater1" runat="server" >
                <HeaderTemplate>
                        <br />
                         <ul class="list-group">
                    </HeaderTemplate>
                    <ItemTemplate>
                            <li class="list-group-item">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr5") %>'></asp:Label><br />
                                <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:d}")%>
                                <span class="badge">
                                    <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:hh:mm tt}")%> - <%# DataBinder.Eval(Container.DataItem, "EndTime", "{0:hh:mm tt}")%>

                                </span>
                                <br />
                                <em><asp:Label ID="Label4" runat="server" Text='<%# Eval("Expr3", "{0:d}" ) %>'></asp:Label></em>
                                
                            </li>
                       
                    </ItemTemplate>
                    <FooterTemplate>
                         </ul>
                    </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>    
</asp:Content>

