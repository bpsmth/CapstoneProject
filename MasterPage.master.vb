
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text = String.Empty Then
            tbSearch.BorderColor = Drawing.Color.Red
        Else
            Response.Redirect("~/Search.aspx?Query=" + tbSearch.Text)
        End If
    End Sub
End Class

