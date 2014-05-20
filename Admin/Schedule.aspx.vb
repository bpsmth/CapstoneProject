Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization

Partial Class Admin_Schedule
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            tbDatepickerStart.Text = Date.Now.ToString("MM/dd/yyyy")
            Dim TodayDate As Date = Date.Now.ToString("MM/dd/yyyy")
            updateSchedule()
        Else
            updateSchedule()

        End If
    End Sub

    Private Sub loadResources()
        DayPilotScheduler1.Resources.Clear()
        Dim da As New SqlDataAdapter("SELECT LocationID AS LocationID, Name As LocationName FROM [Location]", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        Dim dt As New DataTable()
        da.Fill(dt)

        For Each r As DataRow In dt.Rows
            Dim name As String = DirectCast(r("LocationName"), String)
            Dim id As String = DirectCast(r("LocationID").ToString(), String)

            DayPilotScheduler1.Resources.Add(name, id)
        Next
    End Sub

    Private Function dbGetEvents(start As Date, days As Integer) As Object
        Dim da As New SqlDataAdapter("SELECT [EventID], Events.LocationID AS LocationID, [StartTime], [EndTime], Events.PersonID AS PersonID, Person.Name AS PersonName FROM [Events], [Location], [Person] WHERE (Events.PersonID = Person.PersonID) AND (Events.LocationID = Location.LocationID) AND NOT (([StartTime] <= @start) OR ([EndTime] >= @end)) ", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("start", start)
        da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days))
        Dim dt As New DataTable()
        da.Fill(dt)
        Return dt
    End Function

    Private Sub updateSchedule()
        loadResources()
        Dim Start As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)

        DayPilotScheduler1.StartDate = Start

        Dim StartDate As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)


        DayPilotScheduler1.DataSource = dbGetEvents(Start, DayPilotScheduler1.Days)
        DayPilotScheduler1.DataBind()
    End Sub

    Protected Sub tbDatepickerStart_TextChanged(sender As Object, e As EventArgs) Handles tbDatepickerStart.TextChanged
        Dim StartDate As Date = DateTime.ParseExact(tbDatepickerStart.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture)
        updateSchedule()
    End Sub


    Protected Sub DayPilotScheduler1_EventClick(sender As Object, e As DayPilot.Web.Ui.Events.EventClickEventArgs) Handles DayPilotScheduler1.EventClick
        Dim da As New SqlDataAdapter("SELECT [EventID], Events.LocationID AS LocationID, [StartTime], [EndTime], Events.PersonID AS PersonID, Person.Name AS PersonName, Location.name FROM [Events], [Location], [Person] WHERE (EventID = @eventid) AND (Events.PersonID = Person.PersonID) AND (Events.LocationID = Location.LocationID)", ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
        da.SelectCommand.Parameters.AddWithValue("eventid", e.Value)
        Dim dt As New DataTable()
        da.Fill(dt)
        ' 0 EventID, 1 LocationID, 2 Start Time, 3 EndTime, 4 PersonID, 5 PersonName, 6 LocationName

        lblEvent.Text = dt.Rows(0).Item(5).ToString()
        tbStart.Text = dt.Rows(0).Item(2).ToString()
        tbEnd.Text = dt.Rows(0).Item(3).ToString()
        lblEventID.Text = dt.Rows(0).Item(0).ToString()
        dlLocation.SelectedValue = dt.Rows(0).Item(1).ToString()

        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "modal", "openEventDetailsModal()", True)
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
      
        'get selected location
        Dim locationid As Integer = dlLocation.SelectedValue.ToString()

        'Event
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
            Dim cmd As New SqlCommand("UPDATE Events SET StartTime = @starttime, EndTime = @endtime, LocationID = @locationid WHERE EventID = @eventid", conn)

            Dim StartDate As Date = DateTime.ParseExact(tbStart.Text(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)
            Dim EndDate As Date = DateTime.ParseExact(tbEnd.Text(), "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)

            cmd.Parameters.AddWithValue("eventid", lblEventID.Text)
            cmd.Parameters.AddWithValue("starttime", StartDate)
            cmd.Parameters.AddWithValue("endtime", EndDate)
            cmd.Parameters.AddWithValue("locationid", locationid)

            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        End Using

        updateSchedule()
    End Sub

    Protected Sub btnAddEvent_Click(sender As Object, e As EventArgs) Handles btnAddEvent.Click

        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "modal", "openNewEventModal()", True)
    End Sub

    Protected Sub btnNewEventSave_Click(sender As Object, e As EventArgs) Handles btnNewEventSave.Click
        Dim festival As Integer = ddNewEventFestival.SelectedValue()
        Dim person As Integer = ddNewEventPerformer.SelectedValue()
        Dim location As Integer = ddNewEventLocation.SelectedValue()
        Dim starttime As Date = DateTime.ParseExact(tbNewEventStart.Text, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)
        Dim endtime As Date = DateTime.ParseExact(tbNewEventEnd.Text, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture)

        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ConnectionString)
            Dim cmd As New SqlCommand("INSERT INTO Events VALUES (@festival, @person, @location, @starttime, @endtime);", conn)

            cmd.Parameters.AddWithValue("festival", festival)
            cmd.Parameters.AddWithValue("person", person)
            cmd.Parameters.AddWithValue("location", location)
            cmd.Parameters.AddWithValue("starttime", starttime)
            cmd.Parameters.AddWithValue("endtime", endtime)

            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        End Using
        updateSchedule()
    End Sub
End Class
