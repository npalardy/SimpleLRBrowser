#tag Window
Begin Window SelectXojoVersionDlog
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   112
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   112
   MaximizeButton  =   True
   MaxWidth        =   227
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   112
   MinimizeButton  =   True
   MinWidth        =   227
   Placement       =   0
   Resizeable      =   True
   Title           =   "Select Xojo Version"
   Visible         =   True
   Width           =   227
   Begin PopupMenu popVersion
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Select a Version of Xojo"
      Italic          =   False
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   187
   End
   Begin PushButton pshCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pshOK
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   127
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function FindAppsByBundleID(psBundleID As String) As FolderItem()
		  Dim oResults() As FolderItem
		  
		  If (psBundleID = "") Then 
		    Return oResults
		  End If
		  
		  #If TargetMacOS Then
		    //https://developer.apple.com/documentation/coreservices/1449290-lscopyapplicationurlsforbundleid?language=objc
		    
		    Declare Function LSCopyApplicationURLsForBundleIdentifier Lib "Foundation" (inBundleIdentifier As CFStringRef, outError As Ptr) As Ptr
		    Declare Function NSArrayCount Lib "Foundation" selector "count" (ptrToNSArray As Ptr) As UInteger
		    Declare Function NSArrayObjectAtIndex Lib "Foundation" selector "objectAtIndex:" (ptrToNSArray As Ptr, index As UInteger) As Ptr
		    Declare Function CFURLCopyFileSystemPath Lib "Foundation" (anURL As Ptr, pathStyle As Int32) As CFStringRef
		    
		    Const kCFURLPOSIXPathStyle = 0
		    Const kCFURLHFSPathStyle = 1
		    
		    Dim ptrToArray As Ptr = LSCopyApplicationURLsForBundleIdentifier(psBundleID, Nil)
		    If (ptrToArray = Nil) Then Return Nil
		    
		    Dim iResultCount As UInteger = NSArrayCount(ptrToArray)
		    If (iResultCount < 1) Then Return Nil
		    
		    For i As Integer = 0 To iResultCount - 1
		      Dim ptrToNSURL As Ptr = NSArrayObjectAtIndex(ptrToArray, i)
		      If (ptrToNSURL = Nil) Then Continue
		      
		      Dim sNativePath As String = CFURLCopyFileSystemPath(ptrToNSURL, kCFURLPOSIXPathStyle)
		      
		      Try
		        Dim oResult As New FolderItem(sNativePath, FolderItem.PathTypeNative)
		        oResults.Append(oResult)
		      Catch UnsupportedFormatException
		        'ignore
		      End Try
		    Next
		    
		    If (oResults.Ubound >= 0) Then 
		      Return oResults
		    End If
		    Return oResults
		  #EndIf
		  
		  Return oResults
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowModal() As Folderitem
		  // Calling the overridden superclass method.
		  Super.ShowModal
		  
		  Return mSelectedVersion
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mSelectedVersion As folderitem
	#tag EndProperty


#tag EndWindowCode

#tag Events popVersion
	#tag Event
		Sub Open()
		  Const plistBuddyPath = "/usr/libexec/PlistBuddy"
		  
		  // find all the installed versions of Xojo we care to deal with and add them to the popup
		  
		  Dim xojoVersions() As FolderItem = FindAppsByBundleID( "com.xojo.xojo" )
		  
		  Dim sh As New Shell
		  sh.Execute plistBuddyPath + " -h"
		  If sh.Result.InStr("Help - Prints this information") < 1 Then
		    Break
		    Return
		  End If
		  
		  For Each version As folderitem In xojoVersions
		    // <key>CFBundleName</key>
		    // <String>Xojo</String>
		    // <key>CFBundleShortVersionString</key>
		    // <String>19.1.1.44753</String>
		    
		    // /usr/libexec/PlistBuddy -c "Print :CFBundleName"   "/Applications/Xojo 2019 Release 1.1/Xojo 2019r1.1.app/Contents/Info.plist" 
		    // Print :CFBundleShortVersionString
		    
		    sh.Execute plistBuddyPath + " -c ""Print :CFBundleName"" """ + version.NativePath + "/Contents/Info.plist"""
		    
		    Dim result As String = sh.result
		    // bash: /usr/libexec/PlistBuddy: No such file Or directory ????
		    // File Doesn't Exist
		    // error reading ... ?
		    If Result.InStr("No such file Or directory") > 0 Then
		      Continue
		    End If
		    If Result.InStr("File Doesn't Exist") > 0 Then
		      Continue
		    End If
		    If Result.InStr("error reading") > 0 Then
		      Continue
		    End If
		    
		    Dim bundleName As String = result
		    
		    sh.Execute plistBuddyPath + " -c ""Print :CFBundleShortVersionString"" """ + version.NativePath + "/Contents/Info.plist"""
		    
		    result = sh.result
		    
		    Dim versionString As String = result
		    
		    Me.AddRow versionString // bundleName + " " + versionString
		    me.RowTag(me.ListCount - 1) = version
		    
		  Next
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  mSelectedVersion = me.RowTag(me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pshCancel
	#tag Event
		Sub Action()
		  mSelectedVersion = Nil
		  Self.close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pshOK
	#tag Event
		Sub Action()
		  Self.close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
