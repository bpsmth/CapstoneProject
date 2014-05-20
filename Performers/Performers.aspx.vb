
Partial Class Performers_Performers
    Inherits System.Web.UI.Page

    Protected Sub tbSearch_TextChanged(sender As Object, e As EventArgs) Handles tbSearch.TextChanged
        Dim search As String = "SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE ([Type] = 'Performer') AND Name LIKE '%" + tbSearch.Text + "%'"
        SqlDataSource1.SelectCommand = search

    End Sub
End Class
