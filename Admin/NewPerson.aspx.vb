Imports System.IO
Imports System.Data.SqlClient



Partial Class Admin_NewPerson
    Inherits System.Web.UI.Page

    Protected Sub InsertBtn_Click(sender As Object, e As EventArgs) Handles InsertBtn.Click
        Try
            Dim name As String = NameTb.Text.ToString()
            Dim type As String = catDrop.SelectedValue.ToString()
            Dim hometown As String = HomeTb.Text.ToString()
            Dim desc As String = DescTb.Text.ToString()
            Dim cat As String = CatTb.Text.ToString()

            Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            FileUpload1.SaveAs(Server.MapPath("~/images/" + filename))



            Dim per As New SqlConnection(ConfigurationManager.ConnectionStrings("6k185Arts4ConnectionString").ToString())
            per.Open()
            Dim cmd As New SqlCommand("Insert INTO Person(Name,Description,Hometown,imagename,imagepath,Category,Type) values(@name, @desc, @hometown, @imagename, @imagepath, @cat, @type)", per)
            cmd.Parameters.AddWithValue("@name", name)
            cmd.Parameters.AddWithValue("@imagepath", "~/images/" + filename)
            cmd.Parameters.AddWithValue("@desc", desc)
            cmd.Parameters.AddWithValue("@cat", cat)
            cmd.Parameters.AddWithValue("@hometown", hometown)
            cmd.Parameters.AddWithValue("@type", type)
            cmd.Parameters.AddWithValue("@imagename", filename)
            
            cmd.ExecuteNonQuery()
            per.Close()
            NotifyLbl.Text = "Your person was added."
            ClearFields()
        Catch ex As Exception
            NotifyLbl.Text = "Sorry your person could not be added."
        End Try


    End Sub

    Protected Sub CancelBtn_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/Admin/Person.aspx")
    End Sub

    Protected Sub ClearFields()
        NameTb.Text = String.Empty
        DescTb.Text = String.Empty
        CatTb.Text = String.Empty
        HomeTb.Text = String.Empty
        catDrop.SelectedIndex = 0
    End Sub
End Class
