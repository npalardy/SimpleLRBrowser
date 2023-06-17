#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function IsValidLRDB(f as folderitem) As boolean
		  // ok IS THIS a LR db ?
		  // if so these should exist
		  // cached_pages
		  // cached_descriptions
		  // cached_page_descriptions
		  // cached_pagefullname_X_filename_map
		  // cached_images
		  // cached_page_images
		  // cached_blobs
		  // fullText_segments
		  // fullText_segdir
		  // fullText_docsize
		  // fullText_stat
		  // fullText
		  Try
		    
		    Dim db As New sqlitedatabase
		    
		    db.databasefile = f
		    
		    Call db.connect
		    If db.Error Then 
		      Return False
		    End If
		    
		    Dim rs As recordset = db.SQLSelect("select count(*) from sqlite_master where type = 'table' and name not in ( " +_
		    " 'cached_pages', 'cached_descriptions' , 'cached_page_descriptions', 'cached_pagefullname_X_filename_map' , " +_
		    " 'cached_images', 'cached_page_images', 'cached_blobs', 'fullText_segments', 'fullText_segdir' , 'fullText_docsize', " +_
		    " 'fullText_stat', 'fullText' " +_
		    ")")
		    
		    If rs Is Nil Or rs.eof And rs.bof Then
		      Return False
		    End If
		    
		    If rs.idxField(1).IntegerValue <> 0 Then
		      Return False
		    End If
		    
		    Return True
		    
		  Catch
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
