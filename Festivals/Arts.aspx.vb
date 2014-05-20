Imports System.Data.SqlClient
Imports System.Data

Partial Class Festivals_Festivals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        SetRepeaterControl()
    End Sub

    Private Sub SetRepeaterControl()
        Dim myconn As SqlConnection
        Dim mycomm As SqlDataAdapter

        myconn = New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString.ToString)
        mycomm = New SqlDataAdapter("SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.StartTime, Events.EndTime, Festival.festivalID AS Expr1, Festival.name, Festival.year, Festival.[current], Location.LocationID AS Expr2, Location.Name AS Expr3, Person.PersonID AS Expr4, Person.Name AS Expr5, Person.Description, Person.imagename, Person.imagepath, Person.Type FROM Events INNER JOIN Festival ON Events.FestivalID = Festival.festivalID INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID WHERE (Festival.name = 'Arts Festival') AND (Festival.[current] = 1) ORDER BY Events.StartTime", myconn)

        Dim ds As DataSet = New DataSet

        mycomm.Fill(ds)

        Repeater1.DataSource = ds
        Repeater1.DataBind()
    End Sub
End Class
