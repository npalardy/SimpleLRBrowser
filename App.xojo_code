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
		  
		  For i As Integer = 0 To fileOpen.Count - 1
		    // // going to hard code openeing one version
		    // // but this _could_ be a preference
		    // DoOpen2019r11
		    // 
		    // 
		    If fileopen.Item(i) IsA foundLRMenuItem Then
		      Dim item As foundLRMenuItem = foundLRMenuItem( fileopen.Item(i) )
		      item.DoAction
		      Return
		    End If
		    
		  Next i
		  
		  
		  Dim w As New winNowWhat
		  w.Show
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function OpenSelect() As Boolean Handles OpenSelect.Action
			DoOpenSelect()
			
			return true
		End Function
	#tag EndMenuHandler


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
		  If IsValidLRDB(f) = False Then
		    Return
		  End If
		  
		  Dim db As New sqlitedatabase
		  
		  db.databasefile = f
		  
		  Call db.connect
		  
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
		    
		    Dim itemsToAdd() As menuItem
		    Dim itemsToSortBy() As String
		    
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
		          
		          If IsValidLRDB( f ) = False Then
		            Continue
		          End If
		          
		          Dim mi As New foundLRMenuItem
		          mi.Tag = f
		          mi.Text = "Open " + origF.Name
		          mi.AutoEnable = True
		          
		          itemsToAdd.Append mi
		          itemsToSortBy.append mi.Text
		        End If
		      End Try
		    Next 
		    
		    itemsToSortBy.sortwith itemsToAdd
		    
		    For Each item As menuItem In itemsToAdd
		      fileopen.Append item
		    Next 
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
	#tag EndNote


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
