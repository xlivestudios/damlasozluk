Option Explicit Off
Option Strict Off

Imports System
Imports System.IO
Imports System.Web
Imports System.Web.UI
Imports System.Security.Cryptography


Partial Class VB
Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	Controls.Clear()
	Response.Clear()
		
	Try
			
    Dim msj As String = Request.Form("msj")
    Select Case msj
				
			Case "sitemapayaz"
				Try
					Dim url As String = Request.Form("url")
					File.AppendAllText(Server.MapPath("sitemap.xml"), url & vbcrlf)
					Dim reqGoogle As System.Net.WebRequest = System.Net.WebRequest.Create("http://www.google.com/webmasters/sitemaps/ping?sitemap=" + HttpUtility.UrlEncode("http://damlasozluk.com/sitemap.xml"))
					reqGoogle.GetResponse()
					response.write("eklendi")
				Catch z As Exception
					response.write("hata: " + z.ToString())
				End Try				
				
			Case "cookiegetir"
				dim cookie as string =  Request.Form("cookie")
				If Not Request.Cookies("login") Is Nothing Then
					Dim logincookie As HttpCookie = Request.Cookies("login")
					dim hedefcookie as string = (logincookie.Values(cookie))
					Response.Write(hedefcookie)
				Else
					Response.Write("-")
				End If
				
			Case "uyegirisi"
				Dim logincookie As New HttpCookie("login")
				logincookie.Values.Clear()
				logincookie.Values("uid") = Request.Form("uid")
				logincookie.Values("pic") = Request.Form("pic")
				logincookie.Values("isim") = Request.Form("isim")
				logincookie.Values("email") = Request.Form("email")
				logincookie.Expires = System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Turkey Standard Time")).AddDays(+30D)
				Response.Cookies.Add(logincookie)
				Response.Write("Giriş Başarılı")

			case "timestamp"
				Dim milliseconds = CLng(DateTime.UtcNow.Subtract(New DateTime(1970, 1, 1)).TotalMilliseconds)
				Response.Write(milliseconds)
				
		End Select
			
  Catch ex As Exception
     Response.Write(ex.Message)
  End Try
        
End Sub


 	Sub Logla(ByVal Ne As String)
		File.AppendAllText(Server.Mappath("j.txt"), ne & " - " & Now() & vbNewLine)

	End Sub   

    Private Function Encrypt(ByVal clearText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
             &H65, &H64, &H76, &H65, &H64, &H65, _
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function


    Private Function Decrypt(ByVal cipherText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
             &H65, &H64, &H76, &H65, &H64, &H65, _
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                    cs.Write(cipherBytes, 0, cipherBytes.Length)
                    cs.Close()
                End Using
                cipherText = Encoding.Unicode.GetString(ms.ToArray())
            End Using
        End Using
        Return cipherText
    End Function

    Public Yazilacaklar As String = ""
    Sub YazilacaklaraEkle(ByVal ne As String)
        Yazilacaklar = Yazilacaklar & ne
    End Sub


End Class
