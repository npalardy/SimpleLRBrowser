#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #If targetLinux
		    modGTK3.initGtkEntryFix
		    modGTK3.initGtkWidgetHeightFix
		    modGTK3.InitGlobalGTK3Style
		  #EndIf
		  
		  findLRS()
		  
		  // going to hard code openeing one version
		  // but this _could_ be a preference
		  DoOpen2019r11
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function open2019r11() As Boolean Handles open2019r11.Action
			DoOpen2019r11()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function open2020r21() As Boolean Handles open2020r21.Action
			DoOpen2020r21()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Open2021r31() As Boolean Handles Open2021r31.Action
			DoOpen2021r31()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenSelect() As Boolean Handles OpenSelect.Action
			DoOpenSelect()
			
			return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub DoOpen2019r11()
		  // open a Window1 instance to show the 2019r1.1 db
		  
		  Dim w As Window = FirstWindowWithTitle("2019r1.1 Language Reference")
		  
		  If w is nil then
		    
		    Dim db As New sqlitedatabase
		    
		    db.databasefile = SpecialFolder.Resource("XojoLangRefDB 2019r1.1")
		    
		    Call db.connect
		    
		    w = New Window1(db)
		    
		    w.Title = "2019r1.1 Language Reference"
		  End If
		  
		  w.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoOpen2020r21()
		  // open a Window1 instance to show the 2020r2.1 db
		  
		  Dim w As Window = FirstWindowWithTitle("2020r2.1 Language Reference")
		  
		  If w Is Nil Then
		    
		    Dim db As New sqlitedatabase
		    
		    db.databasefile = SpecialFolder.Resource("XojoLangRefDB 2020r2.1")
		    
		    Call db.connect
		    
		    w = New Window1(db)
		    
		    w.Title = "2020r2.1 Language Reference"
		    
		  End If
		  
		  w.show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoOpen2021r31()
		  // open a Window1 instance to show the 2021r3.1 db
		  
		  Dim w As Window = FirstWindowWithTitle("2021r3.1 Language Reference")
		  
		  If w Is Nil Then
		    
		    Dim db As New sqlitedatabase
		    
		    db.databasefile = SpecialFolder.Resource("XojoLangRefDB 2021r3.1")
		    
		    Call db.connect
		    
		    w = New Window1(db)
		    
		    w.Title = "2021r3.1 Language Reference"
		  End If
		  
		  w.show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoOpenSelect()
		  // open a Window1 instance to show the selected LR db
		  
		  Dim dlg As New OpenFileDialog
		  dlg.title = "Select a Language Reference"
		  dlg.PromptText = "Select a Xojo Language Reference database to open"
		  
		  Dim f As folderitem = dlg.ShowModal
		  
		  // it may be they selected the .APP bundle
		  #If targetmacOS 
		    If (f.Directory = True) And (f.Name.EndsWith(".app") = True) Then
		      // see if there is a Contents/Resources/Language Reference/XojoLangRefDB
		      Try
		        f = f.child("Contents").Child("Resources").Child("Language Reference").Child("XojoLangRefDB") 
		        If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		          Return 
		        End If
		      Catch NilObjectException
		        Return 
		      End Try
		  #Else
		    If 1 = 2 Then
		  #EndIf
		  
		  ElseIf (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		    Return 
		  End If
		  
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
		  
		  Dim db As New sqlitedatabase
		  
		  db.databasefile = f
		  
		  Call db.connect
		  If db.Error Then 
		    Return 
		  End If
		  
		  Dim rs As recordset = db.SQLSelect("select count(*) from sqlite_master where type = 'table' and name not in ( " +_
		  " 'cached_pages', 'cached_descriptions' , 'cached_page_descriptions', 'cached_pagefullname_X_filename_map' , " +_
		  " 'cached_images', 'cached_page_images', 'cached_blobs', 'fullText_segments', 'fullText_segdir' , 'fullText_docsize', " +_
		  " 'fullText_stat', 'fullText' " +_
		  ")")
		  
		  If rs Is Nil Or rs.eof And rs.bof Then
		    Return 
		  End If
		  
		  If rs.idxField(1).IntegerValue <> 0 Then
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
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub findLRS()
		  #If TargetMacOS
		    
		    // find all the Xojo ide's
		    Dim ides() As Folderitem = MacOS.FindFilesByBundleID("com.xojo.xojo")
		    Dim f As folderitem 
		    
		    For Each origF As FolderItem In IDES
		      
		      Try
		        // then dive into them to see if there is a db
		        If (origF.Directory = True) And (origF.Name.EndsWith(".app") = True) Then
		          // see if there is a Contents/Resources/Language Reference/XojoLangRefDB
		          Try
		            f = origF.child("Contents").Child("Resources").Child("Language Reference").Child("XojoLangRefDB") 
		            If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		              Continue
		            End If
		          Catch NilObjectException
		            continue
		          End Try
		          
		          Dim db As New sqlitedatabase
		          
		          db.databasefile = SpecialFolder.Resource("XojoLangRefDB 2019r1.1")
		          
		          Call db.connect
		          If db.Error Then 
		            continue
		          End If
		          
		          Dim rs As recordset = db.SQLSelect("select count(*) from sqlite_master where type = 'table' and name not in ( " +_
		          " 'cached_pages', 'cached_descriptions' , 'cached_page_descriptions', 'cached_pagefullname_X_filename_map' , " +_
		          " 'cached_images', 'cached_page_images', 'cached_blobs', 'fullText_segments', 'fullText_segdir' , 'fullText_docsize', " +_
		          " 'fullText_stat', 'fullText' " +_
		          ")")
		          
		          If rs Is Nil Or rs.eof And rs.bof Then
		            continue
		          End If
		          
		          If rs.idxField(1).IntegerValue <> 0 Then
		            continue
		          End If
		          
		          Dim mi As New foundLRMenuItem
		          mi.Tag = f
		          mi.Text = "Open " + origF.Name
		          mi.AutoEnable = True
		          
		          fileOpen.Append mi
		        End If
		      End Try
		    Next 
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
