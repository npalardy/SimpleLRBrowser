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
