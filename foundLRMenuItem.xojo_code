#tag Class
Protected Class foundLRMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  DoAction
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  me.Enabled= true
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DoAction()
		  Dim f As Folderitem = Folderitem(Me.tag)
		  
		  If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		    Return 
		  End If
		  
		  If IsValidLRDB(f) = False Then
		    Return
		  End If
		  
		  Dim db As New sqlitedatabase
		  
		  db.databasefile = f
		  
		  Call db.connect
		  
		  If db.Error Then 
		    Return 
		  End If
		  
		  Dim w As Window = FirstWindowWithTitle(f.NativePath)
		  
		  If w Is Nil Then
		    
		    // Dim db As New sqlitedatabase
		    // 
		    // db.databasefile = SpecialFolder.Resource("XojoLangRefDB 2019r1.1")
		    // 
		    // Call db.connect
		    
		    w = New Window1(db)
		    
		    w.Title = f.NativePath
		  End If
		  
		  w.show
		  
		  Return 
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
