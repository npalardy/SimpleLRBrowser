#tag Class
Protected Class foundLRMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  dim f as Folderitem = Folderitem(Me.tag)
		  
		  If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		    Return True
		  End If
		  
		  Dim db As New sqlitedatabase
		  
		  db.databasefile = f
		  
		  Call db.connect
		  
		  If db.Error Then 
		    Return True
		  End If
		  
		  Dim rs As recordset = db.SQLSelect("select count(*) from sqlite_master where type = 'table' and name not in ( " +_
		  " 'cached_pages', 'cached_descriptions' , 'cached_page_descriptions', 'cached_pagefullname_X_filename_map' , " +_
		  " 'cached_images', 'cached_page_images', 'cached_blobs', 'fullText_segments', 'fullText_segdir' , 'fullText_docsize', " +_
		  " 'fullText_stat', 'fullText' " +_
		  ")")
		  
		  If rs Is Nil Or rs.eof And rs.bof Then
		    Return True
		  End If
		  
		  If rs.idxField(1).IntegerValue <> 0 Then
		    Return True
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
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  me.Enabled= true
		End Sub
	#tag EndEvent


End Class
#tag EndClass
