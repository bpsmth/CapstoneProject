
Partial Class Admin_Person
    Inherits System.Web.UI.Page
    
    Protected Sub tbSearch_TextChanged(sender As Object, e As EventArgs) Handles tbSearch.TextChanged
        Dim search As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE Name LIKE '%" + tbSearch.Text + "%'"
        SqlDataSource1.SelectCommand = search

    End Sub

    Protected Sub catDrop_DataBound(sender As Object, e As EventArgs) Handles catDrop.DataBound
        catDrop.Items.Insert(0, "All Types")


    End Sub

    

    Protected Sub catDrop_TextChanged(sender As Object, e As EventArgs) Handles catDrop.TextChanged
        If catDrop.Text = "All Types" Then
            Dim search1 As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] "
            SqlDataSource1.SelectCommand = search1
        Else
            Dim search2 As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE Type = '" + catDrop.Text + "'"
            SqlDataSource1.SelectCommand = search2
        End If
    End Sub



    Protected Sub NewBtn_Click(sender As Object, e As EventArgs) Handles NewBtn.Click
        Response.Redirect("~/Admin/NewPerson.aspx")
    End Sub
End Class

