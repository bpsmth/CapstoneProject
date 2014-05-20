<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
        <img src="images/4679557-LAS-iowa-arts-festival-06_06_2009-15.46.58.jpg" />
      <div class="carousel-caption">
        <h2>Arts Festival</h2>
          <p>June 6 - 8, 2014</p>
      </div>
    </div>
    <div class="item">
        <img src="images/4743430-LAS-IOWA-CITY-JAZZ-FEST-07_04_2009-19.17.48.jpg" />
        <div class="carousel-caption">
            <h2>Jazz Festival</h2>
            <p>July 3 - 5, 2014</p>
        </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>Latest News</h1>
                <br />
                <div class="post">
                    <h3>Summer Schedule Released</h3>
                    <p>Posted on 3/18/2014 10:00 AM By Lisa Barnes</p>
                    <br />
                    <p>It's that time of year when we are all anxiously awaiting the true arrival of spring!  In anticipation of warmer and longer days, Summer of the Arts released the  line-up of our summer festivals.</p>
                    <p>For complete schedules and bios, visit the respective festival page by clicking on the logo link on the right side of the page, then select the button on the left with the information you are looking for.</p>
                    <p>To access the on-line calendar and add dates to your personal calendar, click on the button at the bottom of the home page.</p>
                    <p>A few highlights:</p>
                    <p><b>Friday Night Concert Series</b> -- kicks off May 16 with The Fez and wraps up Sept. 12 with Fire Sale AND Zeta June</p>
                    <p><b>Saturday Night Concert Series</b> -- the third Saturday of the month in May, June, July & August starting May 17th with the City High and West High Jazz Bands</p>
                    <p><b>Iowa Arts Festival</b> -- June 6-8 featuring Euforquestra and The Indigo Girls on Friday night</p>
                    <p><b>Free Movie Series</b> -- celebrating its 10th year with movies counting from 1 - 10, starting with the June 14 showing of Captain America the First Avenger and finishing with a special Thursday night showing on August 21 of How to Lose a Guy in 10 Days</p>
                    <p><b>MusicIC</b> -- Another wonderful opportunity to experience chamber music enhanced with literature in various downtown locations June 18-21</p>
                    <p><b>Iowa City Jazz Festival</b> -- Moving to Thursday - Saturday, July 3-5, and featuring HUGE names like Joe Lovano and Tom Harrell. The Iowa City fireworks will take place Saturday, July 5</p>
                    <p><b>Iowa Soul Festival</b> -- Moving to the UI Pentacrest Sept 19 & 20 and featuring Al Jarreau Friday night, brought to you by Hancher.  On Sunday, there will be a Gospel Brunch at the Sheraton Iowa City Hotel in collaboration with KCCK Jazz 88.3!</p>
                    <hr />
                </div>
                <div class="post">
                    <h3>Emily McMahon Named Development Director for Summer of the Arts</h3>
                    <p>Posted on 1/24/2014 8:27 AM By Lisa Barnes</p>
                    <br />
                    <p>Emily McMahon has been named development director for Summer of the Arts, the organization that sponsors free summer festivals, concerts and outdoor movies in downtown Iowa City.  Summer of the Arts has grown substantially in the past four years and now produces eight major festivals from May through December.
                    <img class="post-img" src="http://www.summerofthearts.org/Portals/0/MediaReleases/Emily-McMahon-by-Amy-Rose-web.jpg" /></p>
                    <p>“It’s important to remember that the free events sponsored by Summer of the Arts are actually funded by generous individual donors and many wonderful sponsors, including the City of Iowa City,”  said Diana Lundell, president of the board of directors.  “Our goal in bringing Emily on board is to ensure we stay in touch with these partners and to seek out new ones so that we can not only improve the quality of our events, but even add to them.” </p>
                    <p>Lisa Barnes, executive director of Summer of the Arts, welcomed McMahon, saying, “Emily is an experienced professional who will serve as the single point of contact for our sponsors and donors.  She’ll also work with our fundraising committee to develop special events that will further support our mission.”</p>
                    <p>“After volunteering for many years as an intern and board member, I am ecstatic to be the development director for Summer of the Arts.  It feels like I have found an opportunity that fits who I am and what I want to become.  I look forward to connecting the organization with those community members who share our vision.  I am excited to build upon Summer of the Arts’ current relationships, recruit new donors, and engage these community members, which will create loyalty for years to come.  The future of Summer of the Arts is vibrant, and I am thrilled to be a part of it.”</p>
                    <p>McMahon has a bachelor of arts degree from the University of Iowa in Performing Arts Entrepreneurship with course-work in marketing and non-profit management.  She most recently was senior catering manager for the DoubleTree, Cedar Rapids.  Prior to that, she was a catering sales manager from 2008 – 2013 for the Sheraton Iowa City Hotel. She is familiar with Summer of the Arts, having served as an operations intern for the organization in 2008 and as a board of directors member since 2011.</p>
                    <p>McMahon has also been active in the community outside of Summer of the Arts, serving on the EPIC (Empowered Professionals in the Iowa City Area) Leadership Council, Iowa City Junior Service League, American Heart Association Silent Auction Committee member and Greater Iowa City Area Chamber of Commerce Ambassadors.</p>
                    <hr />
                </div>
                
            </div>
            <div class="col-md-4 col-md-offset-2">
          <h3>Upcoming Events</h3>
                         <asp:DropDownList AutoPostBack="true" CssClass="btn btn-default dropdown-toggle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="FestivalID"></asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT [name], [current], [FestivalID] FROM [Festival] WHERE ([current] = @current)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="1"  Name="current" Type="Byte" />
                         </SelectParameters>
                 </asp:SqlDataSource>
                <asp:Repeater ID="Repeater1" runat="server">
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
                                <em><asp:Label ID="Label4" runat="server" Text='<%# Eval("Expr3", "{0:d}" ) %>'></asp:Label></em><br />
                                <asp:HyperLink ID="HyperLink1"  runat="server" NavigateUrl=' <%# DataBinder.Eval(Container.DataItem, "EventID", "~/EventDetail.aspx?EventID={0}")%>' >View Details <i class="glyphicon glyphicon-arrow-right"></i></asp:HyperLink>
                            </li>
                       
                    </ItemTemplate>
                    <FooterTemplate>
                         </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.Time, Events.Date, Festival.festivalID AS Expr1, Festival.name, Festival.year, Location.LocationID AS Expr2, Location.Name AS Expr3, Person.PersonID AS Expr4, Person.Name AS Expr5, Person.Description, Person.imagename, Person.imagepath, Person.Type FROM Events INNER JOIN Festival ON Events.FestivalID = Festival.festivalID INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID WHERE (Events.FestivalID = 5)"></asp:SqlDataSource>
            </div>
            
        </div>
    </div>
</asp:Content>

