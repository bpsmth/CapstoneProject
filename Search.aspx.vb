Imports System.Data.SqlClient
Imports System.Data

Partial Class Search
    Inherits System.Web.UI.Page

    Protected Sub SetDataList()
        Dim myconn As SqlConnection
        Dim mycomm As SqlDataAdapter
        Dim search As String = String.Empty
        search = "SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.StartTime, Events.EndTime, Festival.festivalID AS Expr1, Festival.name, Festival.year, Location.LocationID AS Expr2, Location.Name AS Expr3, Person.PersonID AS Expr4, Person.Name AS Expr5, Person.Description, Person.imagename, Person.imagepath, Person.Category FROM Events INNER JOIN Festival ON Events.FestivalID = Festival.festivalID INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID"
        myconn = New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString.ToString)

        If dropdownlistFestival.SelectedIndex <> 0 Or dropdownlistPerson.SelectedIndex <> 0 Or dropdownlistFestival.SelectedIndex <> 0 Or Request.QueryString("Query") <> String.Empty Then
            search += " Where "
        End If

        If dropdownlistFestival.SelectedIndex <> 0 Then
            search += "Events.FestivalID = " + dropdownlistFestival.SelectedValue
            search += " AND Festival.year = " + dropdownlistFestival.SelectedItem.Text.Remove(0, 15)
        End If

        If dropdownlistPerson.SelectedIndex <> 0 Then

            If dropdownlistFestival.SelectedIndex = 0 And Request.QueryString("Query") = String.Empty Then
                search += " Person.Type LIKE '%" + dropdownlistPerson.SelectedItem.Text + "%'"
            Else
                search += " AND Person.Type LIKE '%" + dropdownlistPerson.SelectedItem.Text + "%'"
            End If


        End If

        If Request.QueryString("Query") <> String.Empty Then
            If dropdownlistFestival.SelectedIndex = 0 And dropdownlistPerson.SelectedIndex = 0 Then
                search += " Person.name LIKE '%" + Request.QueryString("Query") + "%' OR Location.name LIKE '%" + Request.QueryString("Query") + "%' "
            Else
                search += " AND Person.name LIKE '%" + Request.QueryString("Query") + "%' OR Location.name LIKE '%" + Request.QueryString("Query") + "%' "
            End If

        End If

            If DropDownListOrderBy.SelectedIndex = 0 Then
            search += " Order By Events.StartTime DESC"
            ElseIf DropDownListOrderBy.SelectedIndex = 1 Then
            search += " Order By Events.StartTime ASC"
            ElseIf DropDownListOrderBy.SelectedIndex = 2 Then
            search += " Order By Person.name ASC"
            ElseIf DropDownListOrderBy.SelectedIndex = 3 Then
            search += " Order By Person.name DESC"
            End If
        

        mycomm = New SqlDataAdapter(search, myconn)
        Dim ds As DataSet = New DataSet

        mycomm.Fill(ds)

        DataList1.DataSource = ds


        DataList1.DataBind()

        If DataList1.Items.Count = 0 Then
            DataList1.Visible = False
            lblNoRecord.Visible = True
            numberFound.Text = ""
        Else
            DataList1.Visible = True
            numberFound.Text = DataList1.Items.Count.ToString() + " records found"
        End If
    End Sub

    Protected Sub dropdownlistFestival_DataBound(sender As Object, e As EventArgs) Handles dropdownlistFestival.DataBound
        SetDataList()
    End Sub

    Protected Sub dropdownlistPerson_DataBound(sender As Object, e As EventArgs) Handles dropdownlistPerson.DataBound
        SetDataList()
    End Sub

    Protected Sub dropdownlistFestival_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropdownlistFestival.SelectedIndexChanged
        SetDataList()
    End Sub

    Protected Sub dropdownlistPerson_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropdownlistPerson.SelectedIndexChanged
        SetDataList()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False And Request.QueryString("Query") <> String.Empty Then
            tbSearchTerm.Text = Request.QueryString("Query")
            SetDataList()
        End If
    End Sub

    Protected Sub DropDownListOrderBy_DataBound(sender As Object, e As EventArgs) Handles DropDownListOrderBy.DataBound
        SetDataList()
    End Sub

    Protected Sub DropDownListOrderBy_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListOrderBy.SelectedIndexChanged
        SetDataList()
    End Sub

    Protected Sub removeSearchBtn_Click(sender As Object, e As EventArgs) Handles removeSearchBtn.Click
        Response.Redirect("Search.aspx?Query=" + tbSearchTerm.Text)
    End Sub
End Class
