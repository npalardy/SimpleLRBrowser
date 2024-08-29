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
		  
		  FindLanguageReferenceDatabases()
		  
		  For i As Integer = 0 To fileOpen.Count - 1
		    // // going to hard code openeing one version
		    // // but this _could_ be a preference
		    // DoOpen2019r11
		    
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
		  
		  Dim w As Window = FirstWindowWithTitle(f.NativePath)
		  
		  If w Is Nil Then
		    
		    w = New LRWindow(f)
		    
		    w.Title = f.NativePath
		    
		    Dim knownDBs() As String = Preferences.ReadStringArray("Known LR DB's")
		    If knownDBs Is Nil Then
		      knownDBS = Array("")
		      Redim knownDBS(-1)
		    End If
		    
		    If knownDBs.IndexOf(f.NativePath) < 0 then
		      knownDBs.append f.NativePath
		      Preferences.WriteStringArray("Known LR DB's", knownDBs)
		      
		      FindLanguageReferenceDatabases
		    End If
		    
		  End If
		  
		  w.show
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FindLanguageReferenceDatabases()
		  #If TargetMacOS
		    
		    Dim f As folderitem 
		    Dim itemsToAdd() As menuItem
		    Dim itemsToSortBy() As String
		    
		    Dim knownDBs() As String = Preferences.ReadStringArray("Known LR DB's")
		    For Each knownPath As String In knownDBs
		      Try
		        f = New Folderitem(knownPath, folderitem.PathTypeNative)
		        
		        If f.Exists And itemsToSortBy.indexof("Open " + knownPath) < 0 Then
		          Dim mi As New foundLRMenuItem
		          mi.Tag = f
		          mi.Text = "Open " + knownPath
		          mi.AutoEnable = True
		          
		          itemsToAdd.Append mi
		          itemsToSortBy.append mi.Text
		        End If
		        
		      Catch
		        Break
		      End Try
		    Next
		    
		    // find all the Xojo ide's
		    Dim ides() As Folderitem = MacOS.FindFilesByBundleID("com.xojo.xojo")
		    
		    For Each origF As FolderItem In IDES
		      
		      Try
		        // then dive into them to see if there is a db
		        If (origF.Directory = True) And (origF.Name.EndsWith(".app") = True) Then
		          
		          Dim hasLRDB As Boolean = True
		          
		          // see if there is a Contents/Resources/Language Reference/XojoLangRefDB
		          Try
		            f = origF.child("Contents").Child("Resources").Child("Language Reference").Child("XojoLangRefDB") 
		            If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		              hasLRDB = False
		            End If
		          Catch NilObjectException
		            hasLRDB = False
		          End Try
		          
		          if hasLRDB then
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
		          
		          // newer IDE's dont have the XojoLangRefDB
		          // but _may_ have a dir in ~/Libarary/Application Support/Xojo/Xojo/Xojo version/Documentation
		          // if it has offline help
		          
		          Dim hasLocalReference As Boolean = True
		          Try
		            Dim baseAppName As String = origF.DisplayName
		            If baseAppName.EndsWith(".app") Then
		              baseAppName = baseAppName.Left(baseAppName.Length - 4)
		            End If
		            f = SpecialFolder.ApplicationData.child("Xojo").Child("Xojo").Child(baseAppName).Child("Documentation").Child("index.html")  
		            If (f Is Nil) Or (f.exists = False) Or (f.Directory = True) Then
		              hasLocalReference = False
		            End If
		          Catch NilObjectException
		            hasLocalReference = False
		          End Try
		          
		          If hasLocalReference Then
		            
		            Dim mi As New foundNewLocalLRMenuItem
		            mi.Tag = f.parent
		            mi.Text = "Open " + origF.Name
		            mi.AutoEnable = True
		            
		            itemsToAdd.Append mi
		            itemsToSortBy.append mi.Text
		          End If
		          
		        End If
		        
		      End Try
		      
		    Next 
		    
		    itemsToSortBy.sortwith itemsToAdd
		    
		    For i As Integer = fileopen.Count - 1 DownTo 0
		      If fileopen.Item(i) IsA foundNewLocalLRMenuItem Then
		        fileopen.Remove(i)
		      ElseIf fileopen.Item(i) IsA foundLRMenuItem Then
		        fileopen.Remove(i)
		      End If
		    Next
		    
		    For Each item As menuItem In itemsToAdd
		      fileopen.Append item
		    Next 
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Decompressing Sphinx object inventory
		strip the header (see Sphinx Objects Inventory format)
		
		cat /Users/npalardy/Desktop/objects.inv | perl -e 'use Compress::Raw::Zlib;my $d=new Compress::Raw::Zlib::Inflate();my $o;undef $/;$d->inflate(<>,$o);print $o;'
		
	#tag EndNote

	#tag Note, Name = Parsing Sphinx Object inventory
		a regex like
		
		^([^\s]*)\s([^\s]*)\s([^\s]*)\s([^\s]*)\s.*$
		
		seems to work well
		
	#tag EndNote

	#tag Note, Name = Sphinx Object Inventory format
		
		Object inventory file format
		
		https://sphobjinv.readthedocs.io/en/latest/syntax.html
		
		
		Sphinx objects.inv v2 Syntax
		
		After decompression, “version 2” Sphinx objects.inv files follow a syntax that, to the best of this author’s ability to determine, is not included in the Sphinx documentation. The below syntax is believed to be accurate as of Nov 2022 (Sphinx v6.0.0b2). It is based on inspection of objects.inv files “in the wild” and of the Sphinx inventory object parsing regex.
		
		Based upon a quick git diff of the Sphinx repository, it is thought to be valid for all Sphinx versions >=1.0b1 that make use of this “version 2” objects.inv format.
		
		NOTE that previous versions of the syntax presented here have been shown to be inaccurate:
		
		It is permitted for the {name} field to contain whitespace (see #181).
		It is permitted for the {role} field to contain a colon (see #256).
		The descriptions below have been updated to reflect this and to provide more detailed information on the constraints governing each field of an objects.inv data line.
		
		The first line must be exactly:
		
		# Sphinx inventory version 2
		The second and third lines must obey the template:
		
		# Project: <project name>
		# Version: <full version number>
		The version number should not include a leading “v”.
		
		The above project name and version are used to populate mouseovers for the intersphinx cross-references:
		
		_images/mouseover_example.png
		The fourth line must contain the string zlib somewhere within it, but for consistency it should be exactly:
		
		# The remainder of this file is compressed using zlib.
		All remaining lines of the file are the objects data, each laid out in the following syntax:
		
		{name} {domain}:{role} {priority} {uri} {dispname}
		{name}
		
		The object name used when cross-referencing the object (falls between the backticks).
		
		Constraints
		
		MUST have nonzero length
		MUST NOT start with #
		SHOULD have no leading or trailing whitespace
		MAY contain internal whitespace
		{domain}
		The Sphinx domain used when cross-referencing the object (falls between the first and second colons; omitted if using the default domain).
		
		Constraints
		
		MUST have nonzero length
		MUST match a built-in or installable Sphinx domain
		MUST NOT contain whitespace or a colon
		RECOMMENDED to contain only ASCII word characters (a-z, A-Z, 0-9, and _)
		{role}
		The Sphinx role used when cross-referencing the object (falls between the second and third/last colons; or, between the first and second/last colons if using the default domain).
		
		Note that the role MAY contain a colon, as occurs with the :rst:directive:option: directive in the Sphinx docs.
		
		Constraints
		
		MUST have nonzero length
		MUST match a role defined in the domain referenced by {domain}
		MUST NOT contain whitespace
		RECOMMENDED to consist of only ASCII word characters (a-z, A-Z, 0-9, and _)
		{priority}
		Flag for placement in search results. Most will be 1 (standard priority) or -1 (omit from results) for documentation built by Sphinx; values of 0 (higher priority) or 2 (lower priority) may also occur.
		
		To note, as of Jan 2022 this value is not used by intersphinx; it is only used internally within the search function of the static webpages built by Sphinx (here and here). Thus, custom inventories likely MAY use this field for arbitrary content, if desired, as long as the integer constraint is observed. Such use would run the risk of a future change to Sphinx/intersphinx breaking compatibility with objects.inv files having non-standard {priority} values.
		
		Constraints
		
		MUST have nonzero length
		MUST be a positive or negative integer, or zero, without a decimal point
		MUST NOT contain whitespace (implicit in the integer constraint)
		{uri}
		Relative URI for the location to which cross-references will point. The base URI is taken from the relevant element of the intersphinx_mapping configuration parameter in conf.py.
		
		Constraints
		
		MAY have zero length, but typically has nonzero length
		A zero-length {uri} can occur for the root/index documentation page in certain instances; see sphinx-doc/sphinx#7096
		MUST NOT contain whitespace
		{dispname}
		Default cross-reference text to be displayed in compiled documentation.
		
		Constraints
		
		MUST have nonzero length
		MAY contain internal whitespace (leading/trailing whitespace is ignored)
		Unicode characters appear to be valid for all fields except {uri} (where they are specifically forbidden) and {priority}. However, it is RECOMMENDED that they only be used in {dispname}, as their use in {name}, {domain} and {role} would complicate construction of cross-references from other documentation source.
		
		For illustration, the following is the entry for the join() method of the str class in the Python 3.9 objects.inv, broken out field-by-field:
		
		str.join py:method 1 library/stdtypes.html#$ -
		
		{name}      = str.join
		{domain}    = py
		{role}      = method
		{priority}  = 1
		{uri}       = library/stdtypes.html#$
		{dispname}  = -
		The above illustrates two shorthand notations that were introduced to shrink the size of the inventory file:
		
		If {uri} has an anchor (technically a “fragment identifier,” the portion following the # symbol) and the tail of the anchor is identical to {name}, that tail is replaced with $. 
		
		If {dispname} is identical to {name}, it is stored as -.
		Thus, a standard intersphinx reference to this method would take the form:
		
		:py:meth:`str.join`
		The leading :py here could be omitted if py is the default domain.
		
		The cross-reference would show as str.join() and link to the relative URI:
		
		library/stdtypes.html#str.join
		Other intersphinx Syntax Examples
		
		To show as only join():
		
		:py:meth:`~str.join`
		To suppress the hyperlink as in str.join():
		
		:py:meth:`!str.join`
		To change the cross-reference text and omit the trailing parentheses as in This is join!:
		
		:py:obj:`This is join! <str.join>`
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
