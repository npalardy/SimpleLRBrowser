#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1007079423
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   900
   Begin HTMLViewer HTMLViewer1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   572
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   192
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   False
      Top             =   28
      Visible         =   True
      Width           =   708
   End
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   572
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   28
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   193
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField TextField1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   27
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   193
   End
   Begin Timer mOneShotTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin PushButton pbBack
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "<"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   205
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
   Begin PushButton pbFwd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   ">"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   236
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   False
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   27
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  TextField1.SetFocus
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub AddToUrlStack(pageName as string)
		  // System.debuglog CurrentMethodName + " add to stack " + pageName
		  // 
		  // System.debuglog " url stack before"
		  // 
		  // DumpUrlStack()
		  
		  // are we pushing a new entry or just moving in the stack ?
		  If mIsStackMove Then
		    // do NOTHING
		  Else
		    Redim urlstack(urlindex)
		    
		    urlStack.append pageName
		    urlIndex = urlStack.Ubound
		  End If
		  // 
		  // System.debuglog " url stack after"
		  // 
		  // DumpUrlStack()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(db as SQLITEDatabase)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.mdb = db
		  
		  reloadlistbox
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DumpUrlStack()
		  // 
		  // For i As Integer = 0 To urlStack.ubound
		  // Dim prefix As String
		  // If urlIndex = i  Then
		  // prefix = " >>>"
		  // Else
		  // prefix = "    "
		  // End If
		  // 
		  // System.debuglog prefix + urlStack(i)
		  // Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function editpagename(param1 as string) As string
		  
		  // ok there are some screwy urls like 
		  // %EF%BC%83If...%EF%BC%83Endif
		  // which is #if...#EndIf
		  
		  If Trim(param1) = "%EF%BC%83If...%EF%BC%83Endif" Then
		    Return "#if...#Endif"
		  End If
		  If Trim(param1) = "#endif" Then
		    Return "#if...#Endif" // manually redirect
		  End If
		  If Trim(param1) = "#else" Then
		    Return "#if...#Endif" // manually redirect
		  End If
		  If Trim(param1) = "#elseif" Then
		    Return "#if...#Endif" // manually redirect
		  End If
		  
		  If Trim(param1) = "Rem,_//,_%27" Then
		    Return "Rem,_//,_'"
		  End If
		  
		  Return param1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub loadsearchresults()
		  If mDB Is Nil Then
		    return
		  end if
		  
		  Listbox1.DeleteAllRows
		  
		  dim target as string = trim (textfield1.text) 
		  
		  dim rs as recordset = mDB.sqlselect("select id, title from cached_descriptions where title like '%" + target + "%' order by title")
		  
		  dim distances() as integer
		  dim titles() as string
		  dim ids() as Int64
		  
		  dim lowercaseTarget as string = lowercase(target)
		  
		  while rs <> nil and rs.eof <> true
		    
		    distances.Append StringUtils.EditDistance( lowercasetarget, lowercase(rs.field("title").StringValue)) 
		    titles.append rs.field("title").StringValue
		    ids.append rs.field("id").Int64Value
		    
		    rs.movenext
		    
		  wend
		  
		  if distances.ubound <> titles.Ubound or distances.Ubound <> ids.Ubound or titles.Ubound <> ids.Ubound then
		    break
		  end if
		  
		  distances.SortWith titles, ids
		  
		  for i as integer = 0 to distances.ubound
		    listbox1.addrow titles(i)
		    listbox1.rowtag(listbox1.lastindex) = ids(i)
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MoveBackInStack()
		  mIsStackMove = True
		  
		  urlIndex = max(0, urlIndex - 1)
		  
		  ShowPageWithName( urlStack(urlIndex) )
		  
		  mIsStackMove = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MoveForwardInStack()
		  mIsStackMove = True
		  
		  urlIndex = min(urlIndex + 1, urlstack.ubound)
		  
		  ShowPageWithName( urlStack(urlIndex) )
		  
		  mIsStackMove = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub reloadlistbox()
		  If mDB Is Nil Then 
		    return
		  end if
		  
		  HTMLViewer1.LoadPage("<html><head></head><body></body></html>", nil)
		  
		  Listbox1.DeleteAllRows
		  
		  dim rs as recordset = mDB.SQLSelect("select distinct type from cached_descriptions order by type")
		  
		  while rs <> nil and rs.eof <> true
		    
		    Listbox1.AddFolder rs.field("type").StringValue
		    
		    rs.movenext
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowPageWithID(pageID as Int64)
		  // ok look up the right source html and show that
		  Dim query As String = "select * from cached_descriptions where id = " + Str(pageID) 
		  Dim rs As recordset
		  
		  Do
		    rs = mDB.sqlselect(query)
		    
		    If rs Is Nil Then
		      Break
		      Return
		    End If
		    // does this item have a "show instead" value ?
		    // if it does then look that up & keep going up until we have no "show instead"
		    If Trim(rs.Field("showInstead").StringValue) <> "" Then
		      query = "select * from cached_descriptions where title like """ + editpagename( rs.Field("showInstead").StringValue ) + """"
		    End If
		    
		  Loop Until Trim(rs.Field("showInstead").StringValue) = ""
		  
		  pageID = rs.Field("id").IntegerValue
		  
		  // System.debuglog CurrentMethodName + " add to stack " +  "/" + rs.field("title").StringValue 
		  AddToUrlStack( rs.field("title").StringValue )
		  
		  rs = mDB.sqlselect("select * from cached_blobs where cached_page_id = (select cached_page_id from cached_page_descriptions where cached_description_id = " + Str(pageID) + ")" )
		  
		  If rs Is Nil Then
		    Break
		    Return
		  End If
		  
		  Dim htmlText As String = ReplaceAll(htmlwrapper,"<!-- content --><!-- /content -->", rs.field("page_source").StringValue)
		  
		  
		  htmlviewer1.LoadPage(htmltext, Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowPageWithName(pageName as string)
		  
		  Dim nameToFind As String = Trim( editpagename(pageName))
		  
		  // ok look up the right source html and show that
		  Dim query As String = "select * from cached_descriptions where title like """ + nameToFind + """" 
		  Dim rs As recordset
		  
		  Do
		    rs = mDB.sqlselect(query)
		    If rs Is Nil Then
		      Break
		      Return
		    End If
		    // does this item have a "show instead" value ?
		    // if it does then look that up & keep going up until we have no "show instead"
		    If Trim(rs.Field("showInstead").StringValue) <> "" Then
		      query = "select * from cached_descriptions where title like """ + editpagename( rs.Field("showInstead").StringValue ) + """"
		    End If
		    
		  Loop Until Trim(rs.Field("showInstead").StringValue) = ""
		  
		  nameToFind = rs.Field("title").StringValue
		  Dim pageID As Integer = rs.Field("ID").IntegerValue
		  
		  // System.debuglog CurrentMethodName + " add to stack " + "/" + pageName
		  
		  AddToUrlStack( nameToFind )
		  
		  rs = mDB.sqlselect("select * from cached_blobs where cached_page_id = (select cached_page_id from cached_page_descriptions where cached_description_id = " + Str(pageID) + ")" )
		  
		  If rs Is Nil Then
		    Break
		    Return
		  End If
		  
		  Dim htmlText As String = ReplaceAll(htmlwrapper,"<!-- content --><!-- /content -->", rs.field("page_source").StringValue)
		  
		  htmlviewer1.LoadPage(htmltext, Nil)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mDB As sqlitedatabase
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDBKeyToLoad As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsStackMove As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected urlIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected urlStack() As string
	#tag EndProperty


	#tag Constant, Name = htmlwrapper, Type = String, Dynamic = False, Default = \"<!DOCTYPE html>\n<html lang\x3D\"en\" dir\x3D\"ltr\" class\x3D\"client-nojs\">\n<head>\n<meta charset\x3D\"UTF-8\" />\n<meta http-equiv\x3D\"X-UA-Compatible\" content\x3D\"IE\x3Dedge\" />\n<script type\x3D\"text/javascript\">\ndocument.onkeypress \x3D function(event) { \n if ((event.ctrlKey || event.metaKey) && (event.charCode \x3D\x3D 67 || event.charCode \x3D\x3D 99)) {\n      return true ;\n  }\n  return false \n};\n</script>\n<style type\x3D\"text/css\"> \ndiv.codeexample {\n\twhite-space:pre;\n\tpadding-left:30px;\n\tbackground-color:#d0d0d0\n}\ndiv.property_readonly {\n\tfont-weight: bold;\n\tpadding-right: 16px;\n\tbackground-position: right 50%;\n\tbackground-repeat: no-repeat;\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhDAAMANUAAAAAAP////n4Y/79av//d///x+vlN+7rO/z4XPnxTujcM/TmQuPSL+3ZN9/HK9q+KM60KL+hIKGFGP7+/v39/fz8/Pv7+/r6+vn5+fj4+Pb29vX19fT09PPz8/Dw8O/v7+rq6ubm5t/f397e3t3d3dvb29bW1tXV1cnJyb6+vr29va+vr6ioqKWlpaGhoZubm5qampGRkY2NjYGBgX19fXp6enZ2dmRkZFNTU////wAAAAAAAAAAAAAAAAAAAAAAACH5BAEAADkALAAAAAAMAAwAAAZGQI9wSCyCXLOZK1T0rGAk0ovWZJmEKtuGiKkNZTgOUUIuk8eFASLRgEjQarZ7LDAoGI/IeyhJr9t7QmZmRCInJyaHJyNCQQA7)\n}\ndiv.whenchanged {\n\tfont-style: italic;\n\tfont-size: 10px;\n\tcolor: #808080\n}\ndiv.Introduced {\n\tfont-style: italic;\n\tfont-size: 10px;\n\tcolor: #808080\n}\ndiv.deprecated {\n\tfont-style: italic;\n\tfont-size: 10px;\n\tcolor: #808080\n}\ntd.titleClass {\n\tbackground: #E9E9E9;\n\tcolor: green;\n\tfont-size: 130%;\n\tfont-weight: bold;\n\tpadding: 8px\n}\n.dynamicTable {\n\twidth: 80%;\n\tposition: relative;\n\tmargin-left: 20px;\n\tmargin-right: 20px;\n\tborder: 1px solid grey;\n\tpadding: 0px\n}\n.dynamicTable table.innerDynTable {\n\twidth: 100%;\n\tpadding: 2px\n}\n.dynamicTable table.innerDynTable p {\n\tline-height: 1em;\n\tmargin: 0px\n}\n.dynamicTable td.titleClass {\n\tbackground: #E9E9E9;\n\tcolor: black;\n\tfont-size: 130%;\n\tfont-weight: bold;\n\tpadding: 8px\n}\n.propertyTable {\n\twidth: 80%;\n\tposition: relative;\n\tmargin-left: 20px;\n\tmargin-right: 20px;\n\tborder: 1px solid grey;\n\tpadding: 0px;\n\tclear: both\n}\n.propertyTable table.innerDynTable {\n\twidth: 100%;\n\tpadding: 2px\n}\n.propertyTable table.innerDynTable p {\n\tline-height: 1em;\n\tmargin: 0px\n}\n.propertyTable td.titleClass {\n\tbackground: #E9E9E9;\n\tcolor: black;\n\tfont-size: 130%;\n\tfont-weight: bold;\n\tpadding: 8px\n}\n.methodTable {\n\twidth: 80%;\n\tposition: relative;\n\tmargin-left: 20px;\n\tmargin-right: 20px;\n\tborder: 1px solid grey;\n\tpadding: 0px;\n\tclear: both\n}\n.methodTable table.innerDynTable {\n\twidth: 100%;\n\tpadding: 2px\n}\n.methodTable table.innerDynTable p {\n\tline-height: 1em;\n\tmargin: 0px\n}\n.methodTable td.titleClass {\n\tbackground: #E9E9E9;\n\tcolor: black;\n\tfont-size: 130%;\n\tfont-weight: bold;\n\tpadding: 8px\n}\n.eventTable {\n\twidth: 80%;\n\tposition: relative;\n\tmargin-left: 20px;\n\tmargin-right: 20px;\n\tborder: 1px solid grey;\n\tpadding: 0px;\n\tclear: both\n}\n.eventTable table.innerDynTable {\n\twidth: 100%;\n\tpadding: 2px\n}\n.eventTable table.innerDynTable p {\n\tline-height: 1em;\n\tmargin: 0px\n}\n.eventTable td.titleClass {\n\tbackground: #E9E9E9;\n\tcolor: black;\n\tfont-size: 130%;\n\tfont-weight: bold;\n\tpadding: 8px\n}\n.codesnippet {\n\twhite-space: pre-wrap;\n\tfont-family: monospace;\n\tfont-size: 1em;\n\tline-height: 1.1em;\n\tbackground-color: #EEEEEE;\n\tborder: 1px dashed grey;\n\tmargin-left: 20px;\n\tmargin-right: 20px;\n\tpadding: 8px;\n\tpadding-left: 12px\n}\n.codesnippet a {\n\ttext-decoration: none;\n\tcolor: #0000FF;\n\tbackground: none\n}\n.codesnippet a:visited {\n\tcolor: #0000FF\n}\n.codesnippet a:active {\n\tcolor: #faa700\n}\n.codesnippet a:hover {\n\ttext-decoration: underline\n}\n.codesnippet a.stub {\n\tcolor: #0000FF\n}\n.codesnippet a.new\x2C #p-personal a.new {\n\tcolor: #0000FF\n}\n.codesnippet a.new:visited\x2C #p-personal a.new:visited {\n\tcolor: #0000FF\n}\ntable.ambox {\n\tmargin: 0px 20px;\n\tborder: 1px solid #aaa;\n\tborder-left: 10px solid #1e90ff;\n\tbackground: #fbfbfb\n}\ntable.ambox + table.ambox {\n\tmargin-top: -1px\n}\n.ambox th.mbox-text\x2C .ambox td.mbox-text {\n\tpadding: 0.25em 0.5em\n}\n.ambox td.mbox-image {\n\tpadding: 2px 0 2px 0.5em\n}\n.ambox td.mbox-imageright {\n\tpadding: 2px 0.5em 2px 0\n}\ntable.ambox-notice {\n\tborder-left: 10px solid #1e90ff\n}\ntable.ambox-speedy {\n\tborder-left: 10px solid #b22222;\n\tbackground: #fee\n}\ntable.ambox-delete {\n\tborder-left: 10px solid #b22222\n}\ntable.ambox-content {\n\tborder-left: 10px solid #f28500\n}\ntable.ambox-style {\n\tborder-left: 10px solid #f4c430\n}\ntable.ambox-move {\n\tborder-left: 10px solid #9932cc\n}\ntable.ambox-protection {\n\tborder-left: 10px solid #bba\n}\nbody.mediawiki table.mbox-small {\n\tclear: right;\n\tfloat: right;\n\tmargin: 4px 0 4px 1em;\n\twidth: 238px;\n\tfont-size: 88%;\n\tline-height: 1.25em\n}\nbody.mediawiki table.mbox-small-left {\n\tmargin: 4px 1em 4px 0;\n\twidth: 238px;\n\tborder-collapse: collapse;\n\tfont-size: 88%;\n\tline-height: 1.25em\n}\ntable.genericTable {\n\twidth: auto;\n\tposition: relative;\n\tmargin-left: 20px;\n\tborder: 1px solid grey;\n\tborder-collapse: collapse;\n\tpadding: 0px\n}\ntable.genericTable td {\n\tborder: 1px solid grey;\n\tborder-collapse: collapse;\n\ttext-align: left;\n\tpadding: 6px\n}\ntable.genericTable th {\n\tfont-weight: bold;\n\tbackground: #E9E9E9;\n\tborder: 1px solid grey;\n\tborder-collapse: collapse;\n\ttext-align: left;\n\tpadding: 6px\n}\ninput[type\x3D\"text\"] {\n\topacity: 0.99\n}\n/* cache key: realwiki-docs:resourceloader:filter:minify-css:7:62a8175f55460a7f8215ef4d405cbac7 */\n@media print {\na.stub\x2C a.new {\n\tcolor: #ba0000;\n\ttext-decoration: none\n}\n#toc {\n\tborder: 1px solid #aaaaaa;\n\tbackground-color: #f9f9f9;\n\tpadding: 5px\n}\ndiv.floatright {\n\tfloat: right;\n\tclear: right;\n\tposition: relative;\n\tmargin: 0.5em 0 0.8em 1.4em\n}\ndiv.floatright p {\n\tfont-style: italic\n}\ndiv.floatleft {\n\tfloat: left;\n\tclear: left;\n\tposition: relative;\n\tmargin: 0.5em 1.4em 0.8em 0\n}\ndiv.floatleft p {\n\tfont-style: italic\n}\ndiv.center {\n\ttext-align: center\n}\ndiv.thumb {\n\tborder: none;\n\twidth: auto;\n\tmargin-top: 0.5em;\n\tmargin-bottom: 0.8em;\n\tbackground-color: transparent\n}\ndiv.thumbinner {\n\tborder: 1px solid #cccccc;\n\tpadding: 3px !important;\n\tbackground-color: White;\n\tfont-size: 94%;\n\ttext-align: center;\n\toverflow: hidden\n}\nhtml .thumbimage {\n\tborder: 1px solid #cccccc\n}\nhtml .thumbcaption {\n\tborder: none;\n\ttext-align: left;\n\tline-height: 1.4em;\n\tpadding: 3px !important;\n\tfont-size: 94%\n}\ndiv.magnify {\n\tdisplay: none\n}\ndiv.tright {\n\tfloat: right;\n\tclear: right;\n\tmargin: 0.5em 0 0.8em 1.4em\n}\ndiv.tleft {\n\tfloat: left;\n\tclear: left;\n\tmargin: 0.5em 1.4em 0.8em 0\n}\nimg.thumbborder {\n\tborder: 1px solid #dddddd\n}\ntable.rimage {\n\tfloat: right;\n\twidth: 1pt;\n\tposition: relative;\n\tmargin-left: 1em;\n\tmargin-bottom: 1em;\n\ttext-align: center\n}\nbody {\n\tbackground: white;\n\tcolor: black;\n\tmargin: 0;\n\tpadding: 0\n}\n.noprint\x2C div#jump-to-nav\x2C .mw-jump\x2C div.top\x2C div#column-one\x2C #colophon\x2C .editsection\x2C .toctoggle\x2C .tochidden\x2C div#f-poweredbyico\x2C div#f-copyrightico\x2C li#viewcount\x2C li#about\x2C li#disclaimer\x2C li#mobileview\x2C li#privacy\x2C #footer-places\x2C .mw-hidden-catlinks\x2C tr.mw-metadata-show-hide-extended\x2C span.mw-filepage-other-resolutions\x2C #filetoc {\n\tdisplay: none\n}\nul {\n\tlist-style-type: square\n}\n#content {\n\tbackground: none;\n\tborder: none !important;\n\tpadding: 0 !important;\n\tmargin: 0 !important;\n\tdirection: ltr\n}\n#footer {\n\tbackground : white;\n\tcolor : black;\n\tmargin-top: 1em;\n\tborder-top: 1px solid #AAA;\n\tdirection: ltr\n}\nh1\x2C h2\x2C h3\x2C h4\x2C h5\x2C h6 {\n\tfont-weight: bold\n}\np {\n\tmargin: 1em 0;\n\tline-height: 1.2em\n}\npre\x2C .mw-code {\n\tborder: 1pt dashed black;\n\twhite-space: pre;\n\tfont-size: 8pt;\n\toverflow: auto;\n\tpadding: 1em 0;\n\tbackground: white;\n\tcolor: black\n}\ntable.listing\x2C table.listing td {\n\tborder: 1pt solid black;\n\tborder-collapse: collapse\n}\na {\n\tcolor: black !important;\n\tbackground: none !important;\n\tpadding: 0 !important\n}\na:link\x2C a:visited {\n\tcolor: #520;\n\tbackground: transparent;\n\ttext-decoration: underline\n}\n#content a.external.text:after\x2C #content a.external.autonumber:after {\n\tcontent: \" (\" attr(href) \") \"\n}\n#globalWrapper {\n\twidth: 100% !important;\n\tmin-width: 0 !important\n}\n#content {\n\tbackground: white;\n\tcolor: black\n}\n#column-content {\n\tmargin: 0 !important\n}\n#column-content #content {\n\tpadding: 1em;\n\tmargin: 0 !important\n}\na\x2C a.external\x2C a.new\x2C a.stub {\n\tcolor: black !important;\n\ttext-decoration: none !important\n}\na\x2C a.external\x2C a.new\x2C a.stub {\n\tcolor: inherit !important;\n\ttext-decoration: inherit !important\n}\nimg {\n\tborder: none;\n\tvertical-align: middle\n}\nspan.texhtml {\n\tfont-family: serif\n}\n#siteNotice {\n\tdisplay: none\n}\nli.gallerybox {\n\tvertical-align: top;\n\tdisplay: -moz-inline-box;\n\tdisplay: inline-block\n}\nul.gallery\x2C li.gallerybox {\n\tzoom: 1;\n*display:inline\n}\nul.gallery {\n\tmargin: 2px;\n\tpadding: 2px;\n\tdisplay: block\n}\nli.gallerycaption {\n\tfont-weight: bold;\n\ttext-align: center;\n\tdisplay: block;\n\tword-wrap: break-word\n}\nli.gallerybox div.thumb {\n\ttext-align: center;\n\tborder: 1px solid #ccc;\n\tmargin: 2px\n}\ndiv.gallerytext {\n\toverflow: hidden;\n\tfont-size: 94%;\n\tpadding: 2px 4px;\n\tword-wrap: break-word\n}\ntable.diff {\n\tbackground: white\n}\ntd.diff-otitle {\n\tbackground: #ffffff\n}\ntd.diff-ntitle {\n\tbackground: #ffffff\n}\ntd.diff-addedline {\n\tbackground: #ccffcc;\n\tfont-size: smaller;\n\tborder: solid 2px black\n}\ntd.diff-deletedline {\n\tbackground: #ffffaa;\n\tfont-size: smaller;\n\tborder: dotted 2px black\n}\ntd.diff-context {\n\tbackground: #eeeeee;\n\tfont-size: smaller\n}\n.diffchange {\n\tcolor: silver;\n\tfont-weight: bold;\n\ttext-decoration: underline\n}\ntable.wikitable\x2C table.mw_metadata {\n\tmargin: 1em 0;\n\tborder: 1px #aaa solid;\n\tbackground: white;\n\tborder-collapse: collapse\n}\ntable.wikitable > tr > th\x2C table.wikitable > tr > td\x2C table.wikitable > * > tr > th\x2C table.wikitable > * > tr > td\x2C .mw_metadata th\x2C .mw_metadata td {\n\tborder: 1px #aaa solid;\n\tpadding: 0.2em\n}\ntable.wikitable > tr > th\x2C table.wikitable > * > tr > th\x2C .mw_metadata th {\n\ttext-align: center;\n\tbackground: white;\n\tfont-weight: bold\n}\ntable.wikitable > caption\x2C .mw_metadata caption {\n\tfont-weight: bold\n}\na.sortheader {\n\tmargin: 0 0.3em\n}\n.wikitable\x2C .thumb\x2C img {\n\tpage-break-inside: avoid\n}\nh2\x2C h3\x2C h4\x2C h5\x2C h6\x2C h7 {\n\tpage-break-after: avoid\n}\np {\n\twidows: 3;\n\torphans: 3\n}\n.catlinks ul {\n\tdisplay: inline;\n\tmargin: 0;\n\tpadding: 0;\n\tlist-style: none;\n\tlist-style-type: none;\n\tlist-style-image: none;\nvertical-align:middle !ie\n}\n.catlinks li {\n\tdisplay: inline-block;\n\tline-height: 1.15em;\n\tpadding: 0 .4em;\n\tborder-left: 1px solid #AAA;\n\tmargin: 0.1em 0;\n\tzoom: 1;\ndisplay:inline !ie\n}\n.catlinks li:first-child {\n\tpadding-left: .2em;\n\tborder-left: none\n}\n}\n@media screen {\n.mw-content-ltr {\n\tdirection: ltr\n}\n.mw-content-rtl {\n\tdirection: rtl\n}\n.sitedir-ltr textarea\x2C .sitedir-ltr input {\n\tdirection: ltr\n}\n.sitedir-rtl textarea\x2C .sitedir-rtl input {\n\tdirection: rtl\n}\ninput[type\x3D\"submit\"]\x2C input[type\x3D\"button\"]\x2C input[type\x3D\"reset\"]\x2C input[type\x3D\"file\"] {\n\tdirection: ltr\n}\ntextarea[dir\x3D\"ltr\"]\x2C input[dir\x3D\"ltr\"] {\n\tdirection: ltr\n}\ntextarea[dir\x3D\"rtl\"]\x2C input[dir\x3D\"rtl\"] {\n\tdirection: rtl\n}\nabbr\x2C acronym\x2C .explain {\n\tborder-bottom: 1px dotted;\n\tcursor: help\n}\n.mw-plusminus-pos {\n\tcolor: #006400\n}\n.mw-plusminus-neg {\n\tcolor: #8b0000\n}\n.mw-plusminus-null {\n\tcolor: #aaa\n}\n.allpagesredirect\x2C .redirect-in-category\x2C .watchlistredir {\n\tfont-style: italic\n}\nspan.comment {\n\tfont-style: italic\n}\nspan.changedby {\n\tfont-size: 95%\n}\n.texvc {\n\tdirection: ltr;\n\tunicode-bidi: embed\n}\nimg.tex {\n\tvertical-align: middle\n}\nspan.texhtml {\n\tfont-family: serif\n}\n#wikiPreview.ontop {\n\tmargin-bottom: 1em\n}\n#editform\x2C #toolbar\x2C #wpTextbox1 {\n\tclear: both\n}\n#toolbar img {\n\tcursor: pointer\n}\n.mw-content-ltr .editsection\x2C .mw-content-rtl .mw-content-ltr .editsection {\n\tfloat: right;\n\tmargin-left: 5px\n}\n.mw-content-rtl .editsection\x2C .mw-content-ltr .mw-content-rtl .editsection {\n\tfloat: left;\n\tmargin-right: 5px\n}\ndiv.mw-filepage-resolutioninfo {\n\tfont-size: smaller\n}\nh2#filehistory {\n\tclear: both\n}\ntable.filehistory th\x2C table.filehistory td {\n\tvertical-align: top\n}\ntable.filehistory th {\n\ttext-align: left\n}\ntable.filehistory td.mw-imagepage-filesize\x2C table.filehistory th.mw-imagepage-filesize {\n\twhite-space: nowrap\n}\ntable.filehistory td.filehistory-selected {\n\tfont-weight: bold\n}\n.filehistory a img\x2C #file img:hover {\n\tbackground: white url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAGElEQVQYV2N4DwX/oYBhgARgDJjEAAkAAEC99wFuu0VFAAAAAElFTkSuQmCC) repeat;\n}\nli span.deleted\x2C span.history-deleted {\n\ttext-decoration: line-through;\n\tcolor: #888;\n\tfont-style: italic\n}\n.not-patrolled {\n\tbackground-color: #ffa\n}\n.unpatrolled {\n\tfont-weight: bold;\n\tcolor: red\n}\ndiv.patrollink {\n\tfont-size: 75%;\n\ttext-align: right\n}\ntd.mw-label {\n\ttext-align: right\n}\ntd.mw-input {\n\ttext-align: left\n}\ntd.mw-submit {\n\ttext-align: left\n}\ntd.mw-label {\n\tvertical-align: top\n}\n.prefsection td.mw-label {\n\twidth: 20%\n}\n.prefsection table {\n\twidth: 100%\n}\ntd.mw-submit {\n\twhite-space: nowrap\n}\ntable.mw-htmlform-nolabel td.mw-label {\n\twidth: 1px\n}\ntr.mw-htmlform-vertical-label td.mw-label {\n\ttext-align: left !important\n}\n.mw-htmlform-invalid-input td.mw-input input {\n\tborder-color: red\n}\n.mw-htmlform-flatlist div.mw-htmlform-flatlist-item {\n\tdisplay: inline;\n\tmargin-right: 1em;\n\twhite-space: nowrap\n}\ninput#wpSummary {\n\twidth: 80%;\n\tmargin-bottom: 1em\n}\n.mw-content-ltr .thumbcaption {\n\ttext-align: left\n}\n.mw-content-rtl .thumbcaption {\n\ttext-align: right\n}\n.mw-content-ltr .magnify {\n\tfloat: right\n}\n.mw-content-rtl .magnify {\n\tfloat: left\n}\n#catlinks {\n\ttext-align: left\n}\n.catlinks ul {\n\tdisplay: inline;\n\tmargin: 0;\n\tpadding: 0;\n\tlist-style: none;\n\tlist-style-type: none;\n\tlist-style-image: none;\nvertical-align:middle !ie\n}\n.catlinks li {\n\tdisplay: inline-block;\n\tline-height: 1.25em;\n\tborder-left: 1px solid #AAA;\n\tmargin: 0.125em 0;\n\tpadding: 0 0.5em;\n\tzoom: 1;\ndisplay:inline !ie\n}\n.catlinks li:first-child {\n\tpadding-left: 0.25em;\n\tborder-left: none\n}\n.mw-hidden-cats-hidden {\n\tdisplay: none\n}\n.catlinks-allhidden {\n\tdisplay: none\n}\np.mw-ipb-conveniencelinks\x2C p.mw-protect-editreasons\x2C p.mw-filedelete-editreasons\x2C p.mw-delete-editreasons\x2C p.mw-revdel-editreasons {\n\tfont-size: 90%;\n\ttext-align: right\n}\n.os-suggest {\n\toverflow: auto;\n\toverflow-x: hidden;\n\tposition: absolute;\n\ttop: 0;\n\tleft: 0;\n\twidth: 0;\n\tbackground-color: white;\n\tborder-style: solid;\n\tborder-color: #AAAAAA;\n\tborder-width: 1px;\n\tz-index: 99;\n\tfont-size: 95%\n}\ntable.os-suggest-results {\n\tfont-size: 95%;\n\tcursor: pointer;\n\tborder: 0;\n\tborder-collapse: collapse;\n\twidth: 100%\n}\n.os-suggest-result\x2C .os-suggest-result-hl {\n\twhite-space: nowrap;\n\tbackground-color: white;\n\tcolor: black;\n\tpadding: 2px\n}\n.os-suggest-result-hl\x2C .os-suggest-result-hl-webkit {\n\tbackground-color: #4C59A6;\n\tcolor: white\n}\n.os-suggest-toggle {\n\tposition: relative;\n\tleft: 1ex;\n\tfont-size: 65%\n}\n.os-suggest-toggle-def {\n\tposition: absolute;\n\ttop: 0;\n\tleft: 0;\n\tfont-size: 65%;\n\tvisibility: hidden\n}\n.autocomment {\n\tcolor: gray\n}\n#pagehistory .history-user {\n\tmargin-left: 0.4em;\n\tmargin-right: 0.2em\n}\n#pagehistory span.minor {\n\tfont-weight: bold\n}\n#pagehistory li {\n\tborder: 1px solid white\n}\n#pagehistory li.selected {\n\tbackground-color: #f9f9f9;\n\tborder: 1px dashed #aaa\n}\n.mw-history-revisiondelete-button\x2C #mw-fileduplicatesearch-icon {\n\tfloat: right\n}\n.newpage\x2C .minoredit\x2C .botedit {\n\tfont-weight: bold\n}\n#shared-image-dup\x2C #shared-image-conflict {\n\tfont-style: italic\n}\ndiv.mw-warning-with-logexcerpt {\n\tpadding: 3px;\n\tmargin-bottom: 3px;\n\tborder: 2px solid #2F6FAB;\n\tclear: both\n}\ndiv.mw-warning-with-logexcerpt ul li {\n\tfont-size: 90%\n}\nspan.mw-revdelundel-link\x2C strong.mw-revdelundel-link {\n\tfont-size: 90%\n}\nspan.mw-revdelundel-hidden\x2C input.mw-revdelundel-hidden {\n\tvisibility: hidden\n}\ntd.mw-revdel-checkbox\x2C th.mw-revdel-checkbox {\n\tpadding-right: 10px;\n\ttext-align: center\n}\na.feedlink {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABmJLR0QA/wD/AP+gvaeTAAAAB3RJTUUH2AkOCjkSL9xYhAAAAc9JREFUKJE90LFrU1EYQPHzffe+l/iSVkXTmNiANBU7iE5OLrbSVYKIiy5dnARB3FwEB5dOOhQKuthJEEHRsUXBoosO0lKKEYRa29LWQk3S5L53r0PVv+D8OPJlolrrr1ZmI7F1BFEjqBXECGJAjSBCaLddc7u5Mmb7q5U5007rWh5E9rYR/xsTBBXBWMVEglqRpGiGhcE5G6kdyugxcGsGyRdJ15ZwC29IF55jNEWt8K+aFOMhc+dC7Z6SITjC7ga2MkI8cpH41Dhh7RPa20Gt4toZac+IqhFMTpG0hVt8RetJg967SaTvGLnGNKZ0EtfOcB1P5jyqVjCRkIzfpnjtMYXrT2FrCff6JqhFRx/gnCXtZHgXUFHQSGg/u4Gbf4T2lYkvTaFGce8fIgePY09fwXU8Pg3sk2JFu5v4lQ+4FxPge+j5u3Q+v8TvrBKfbZB1PT4LqJh9Uv7yFLmrM2i+gPs4jRyqIaUz7C2+xZZOEA4cJaSgaAhqhbC1DK0N3K9NusvzAHB4GLf+HQBJBsiCD7J6/9zXI2VbVyv/b6Sdv1e6nrTryboB7wVbyjXt1rcfo0Frs4UkqvtUJHMBjyVEAcSjFiQJwRvf3F3/OfYH/dDFWrCooaIAAAAASUVORK5CYII\x3D) center left no-repeat;\n\tpadding-left: 16px\n}\n.plainlinks a {\n\tbackground: none !important;\n\tpadding: 0 !important\n}\n.rtl a.external.free\x2C .rtl a.external.autonumber {\n\tdirection: ltr;\n\tunicode-bidi: embed\n}\ntable.wikitable {\n\tmargin: 1em 0;\n\tbackground-color: #f9f9f9;\n\tborder: 1px #aaa solid;\n\tborder-collapse: collapse;\n\tcolor: black\n}\ntable.wikitable > tr > th\x2C table.wikitable > tr > td\x2C table.wikitable > * > tr > th\x2C table.wikitable > * > tr > td {\n\tborder: 1px #aaa solid;\n\tpadding: 0.2em\n}\ntable.wikitable > tr > th\x2C table.wikitable > * > tr > th {\n\tbackground-color: #f2f2f2;\n\ttext-align: center\n}\ntable.wikitable > caption {\n\tfont-weight: bold\n}\ntable.collapsed tr.collapsable {\n\tdisplay: none\n}\n.success {\n\tcolor: green;\n\tfont-size: larger\n}\n.warning {\n\tcolor: #FFA500;\n\tfont-size: larger\n}\n.error {\n\tcolor: red;\n\tfont-size: larger\n}\n.errorbox\x2C .warningbox\x2C .successbox {\n\tfont-size: larger;\n\tborder: 2px solid;\n\tpadding: .5em 1em;\n\tfloat: left;\n\tmargin-bottom: 2em;\n\tcolor: #000\n}\n.errorbox {\n\tborder-color: red;\n\tbackground-color: #fff2f2\n}\n.warningbox {\n\tborder-color: #FF8C00;\n\tbackground-color: #FFFFC0\n}\n.successbox {\n\tborder-color: green;\n\tbackground-color: #dfd\n}\n.errorbox h2\x2C .warningbox h2\x2C .successbox h2 {\n\tfont-size: 1em;\n\tfont-weight: bold;\n\tdisplay: inline;\n\tmargin: 0 .5em 0 0;\n\tborder: none\n}\n.mw-infobox {\n\tborder: 2px solid #ff7f00;\n\tmargin: 0.5em;\n\tclear: left;\n\toverflow: hidden\n}\n.mw-infobox-left {\n\tmargin: 7px;\n\tfloat: left;\n\twidth: 35px\n}\n.mw-infobox-right {\n\tmargin: 0.5em 0.5em 0.5em 49px\n}\n.previewnote {\n\tcolor: #c00;\n\tmargin-bottom: 1em\n}\n.previewnote p {\n\ttext-indent: 3em;\n\tmargin: 0.8em 0\n}\n.visualClear {\n\tclear: both\n}\n#mw_trackbacks {\n\tborder: solid 1px #bbbbff;\n\tbackground-color: #eeeeff;\n\tpadding: 0.2em\n}\n.mw-datatable {\n\tborder-collapse: collapse\n}\n.mw-datatable\x2C .mw-datatable td\x2C .mw-datatable th {\n\tborder: 1px solid #aaaaaa;\n\tpadding: 0 0.15em 0 0.15em\n}\n.mw-datatable th {\n\tbackground-color: #ddddff\n}\n.mw-datatable td {\n\tbackground-color: #ffffff\n}\n.mw-datatable tr:hover td {\n\tbackground-color: #eeeeff\n}\n.TablePager {\n\tmin-width: 80%\n}\n.TablePager_nav {\n\tmargin: 0 auto\n}\n.TablePager_nav td {\n\tpadding: 3px;\n\ttext-align: center\n}\n.TablePager_nav a {\n\ttext-decoration: none\n}\n.imagelist td\x2C .imagelist th {\n\twhite-space: nowrap\n}\n.imagelist .TablePager_col_links {\n\tbackground-color: #eeeeff\n}\n.imagelist .TablePager_col_img_description {\n\twhite-space: normal\n}\n.imagelist th.TablePager_sort {\n\tbackground-color: #ccccff\n}\nul#filetoc {\n\ttext-align: center;\n\tborder: 1px solid #aaaaaa;\n\tbackground-color: #f9f9f9;\n\tpadding: 5px;\n\tfont-size: 95%;\n\tmargin-bottom: 0.5em;\n\tmargin-left: 0;\n\tmargin-right: 0\n}\n#filetoc li {\n\tdisplay: inline;\n\tlist-style-type: none;\n\tpadding-right: 2em\n}\ntable.mw_metadata {\n\tfont-size: 0.8em;\n\tmargin-left: 0.5em;\n\tmargin-bottom: 0.5em;\n\twidth: 400px\n}\ntable.mw_metadata caption {\n\tfont-weight: bold\n}\ntable.mw_metadata th {\n\tfont-weight: normal\n}\ntable.mw_metadata td {\n\tpadding: 0.1em\n}\ntable.mw_metadata {\n\tborder: none;\n\tborder-collapse: collapse\n}\ntable.mw_metadata td\x2C table.mw_metadata th {\n\ttext-align: center;\n\tborder: 1px solid #aaaaaa;\n\tpadding-left: 5px;\n\tpadding-right: 5px\n}\ntable.mw_metadata th {\n\tbackground-color: #f9f9f9\n}\ntable.mw_metadata td {\n\tbackground-color: #fcfcfc\n}\ntable.mw_metadata ul.metadata-langlist {\n\tlist-style-type: none;\n\tlist-style-image: none;\n\tpadding-right: 5px;\n\tpadding-left: 5px;\n\tmargin: 0\n}\n.mw-content-ltr ul\x2C .mw-content-rtl .mw-content-ltr ul {\n\tmargin: 0.3em 0 0 1.6em;\n\tpadding: 0\n}\n.mw-content-rtl ul\x2C .mw-content-ltr .mw-content-rtl ul {\n\tmargin: 0.3em 1.6em 0 0;\n\tpadding: 0\n}\n.mw-content-ltr ol\x2C .mw-content-rtl .mw-content-ltr ol {\n\tmargin: 0.3em 0 0 3.2em;\n\tpadding: 0\n}\n.mw-content-rtl ol\x2C .mw-content-ltr .mw-content-rtl ol {\n\tmargin: 0.3em 3.2em 0 0;\n\tpadding: 0\n}\n.mw-content-ltr dd\x2C .mw-content-rtl .mw-content-ltr dd {\n\tmargin-left: 1.6em;\n\tmargin-right: 0\n}\n.mw-content-rtl dd\x2C .mw-content-ltr .mw-content-rtl dd {\n\tmargin-right: 1.6em;\n\tmargin-left: 0\n}\nli.gallerybox {\n\tvertical-align: top;\n\tdisplay: -moz-inline-box;\n\tdisplay: inline-block\n}\nul.gallery\x2C li.gallerybox {\n\tzoom: 1;\n*display:inline\n}\nul.gallery {\n\tmargin: 2px;\n\tpadding: 2px;\n\tdisplay: block\n}\nli.gallerycaption {\n\tfont-weight: bold;\n\ttext-align: center;\n\tdisplay: block;\n\tword-wrap: break-word\n}\nli.gallerybox div.thumb {\n\ttext-align: center;\n\tborder: 1px solid #ccc;\n\tbackground-color: #f9f9f9;\n\tmargin: 2px\n}\nli.gallerybox div.thumb img {\n\tdisplay: block;\n\tmargin: 0 auto\n}\ndiv.gallerytext {\n\toverflow: hidden;\n\tfont-size: 94%;\n\tpadding: 2px 4px;\n\tword-wrap: break-word\n}\n.mw-ajax-loader {\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhIAAgAOMAAP///wAAAMbGxoSEhLa2tpqamjY2NlZWVtjY2OTk5Ly8vB4eHgQEBP///////////yH/C05FVFNDQVBFMi4wAwEAAAAh+QQFCgAPACwAAAAAIAAgAAAE5/DJSWlhperN52JLhSSdRgwVo1ICQZRUsiwHpTJT4iowNS8vyW2icCF6k8HMMBk+EDskxTBDPZwuAkkqIfxIQyhBQBFvHwSDITM5VDW6XNE4KagNh6Bgwe60smQUB3d4Rz1ZBApnFASDd0hihh12BkE9kjAJVlycXIg7CQIFA6SlnJ87paqbSKiKoqusnbMdmDC2tXQlkUhziYtyWTxIfy6BE8WJt5YJvpJivxNaGmLHT0VnOgSYf0dZXS7APdpB309RnHOG5g/qXGLDaC457D1zZ/V/nmOM82XiHRLYKhKP1oZmADdEAAAh+QQFCgAPACwAAAAAGAAXAAAEcvDJSesiNetplqlDsYnUYlIGw2jGV55SoS5sq0wmLS3qoBWtAw42mG0ehxYp90CoGKRNy8U8qFzNweCGwlJkgolCq0VIEAbMkUIghxLrDcLti2/Gg7D9qN774wkKBIOEfw+ChIV/gYmDho+QkZKTR3p7EQAh+QQFCgAPACwBAAAAHQAOAAAEcvDJSScxNev9jjkZwU2IUhkodSzLKA2DOKGYRLD1CA/InEoGlkui2PlyuKGkADM9aI8EayGbJDYI4zM1YIEmAwajkCAoehNmTNNaLsQMHmGuuEYHgpHAAGfUBHNzeUp9VBQJCoFOLmFxWHNoQweRWEocEQAh+QQFCgAPACwHAAAAGQARAAAEavDJ+cQQNOtdRsnf9iRINpyZYYgEgU3nQKnr1hIJjEqHGmqIlkInexRUB5FE0So9YhKaUpK4SaAPlWaxIFAETQ3B4BxzF2Kn8nBeJKebdm3SgksKXDt8kNP7/xoMgoMLP36DiAyAD4kMhREAIfkEBQoADwAsDgAAABIAGAAABGUQFfSqvZiUghXF1cZZxTCA4WYh5omKVqugD/woLV2rT/u9KoJpFDIYaIJBwnIwGogoivOoq0wPs6r1qe16v5WFeEzVjc+LKnphIIC9g193wGC4uvX6Aoo05BllVQULeXdadAxuEQAh+QQFCgAPACwOAAAAEgAeAAAEgDCp9Kq9WBGFBb5ECBbFV4XERaYmahGk14qPQJbm4z53foq2AquiGAwQJsQQYTRyfIlCc4DzTY8+i8CZxQy74KxhTD58P+S0Qaw+hN8WyruwWMDrdcM5ecAv3CYDDDIEBngmBwwMaxeGJgmKDFVdggx2bwuKA28EkXAGinJhVCYRACH5BAUKAA8ALA8AAQARAB8AAAR88Mn5UKIYC0KyT5ziZQqHjBQSohRHXGzFCSkHU/eTlCa7uTSUi6DIeVSEU0yiXDo9g6i0EIRKr6hrlPrsOgkGQ8EZDh+eZcOosKAcymPKYLE4TwphCWMvoS86HnsME3RqgXwSBnQjghR+h4MTB4sZjRiAGAsMbU4FDHFLEQAh+QQFCgAPACwIAA4AGAASAAAEbPDJSesjOKtk+8yg4nkgto1oihIqKgyD2FpwjcxUUtRDMROG2wPBkz0EjEHHYKgoYMKHgcE4PBZYCbM5KlAZHOxCUmBaPQuq8pqVHJg+GnUsEVO2nTQjzqZPmB1UXHVtE3wVOxUGC4M4H34qEQAh+QQFCgAPACwCABIAHQAOAAAEePDJSat96FJ0tEUEkV0DwwwepYSEklDEYpopJbCEIBkzY+geweD1SKxCiJJpUZAgmBbCYNCcIFaJggk1OSwWKINYMh2MLMRJ7LsbPxTl2sTAbhsmhalC/vje7VZxNXQLBHNuEnlcKV8dh38TCmcehhUHBo58cpA1EQAh+QQFCgAPACwAAA8AGQARAAAEZ7AsRuu7OOtbO9tgJnlfaJ7omQwpuixFCxrvK2dHvRwoQmw1w+8i3PgIggzBpjEYLoPohUBNoJzPR5T1OCpOB2dMK70oqIhQwcmDlh8J6nCDzWwzAmrIqblnEFZqGgUDYzcaAgNJGxEAIfkEBQoADwAsAQAIABEAGAAABFyQMDaevfiOyVbJ4GNwjCGEWLGQaLZRbYZUcW3feK7vaGEYNsXh96sRgYiW73e4JAYn0O9zKQwGhAdhi5pdLdts6DpQgLkgBfkSHl+TZ7ELi2mDEHKLgmC+JRQJEQAh+QQFCgAPACwAAAIADgAdAAAEcvDJ+cqgeDJmMt4M4U3DtozTsl1oASJpRxnbkS6LIT4Cw0oHHO4A8xAMwhPqgSssH4nnknAwWK+Zq1ZGoW650vAOpRgMBCOEee2xrAtRTNlcQEsI8Yd6oKAICARFHgmAYx4KgIIZCIB9ZIB5RgR2KAmKEQA7);\n\tbackground-position: center center;\n\tbackground-repeat: no-repeat;\n\tpadding: 16px;\n\tposition: relative;\n\ttop: -16px\n}\n.mw-small-spinner {\n\tpadding: 10px !important;\n\tmargin-right: 0.6em;\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhFAAUAIQQAAYJBRkbGCYnJTI0MT9APk5QTVhZV2ZoZXR2c4SGg5CSj52fnKyuq7m7uMfJxtPV0v///////////////////////////////////////////////////////////////yH/C05FVFNDQVBFMi4wAwEAAAAh+QQJCgABACwAAAAAFAAUAAAFc2AgjuNQkCipHCMAiI6TjoWAiG7gNM08CgTca+cbGWyBXEMm6okMJxGBNWLuGo8ngWBY+HgxlIFwm4VnimKKkWgn1Dzwwv0uxpfqfJWZ2p1hV0VXTA9gMCRETXxOOj08jXxfMo+NcHiUgT5nlAFZejqRKCEAIfkECQoADAAsAAAAABQAFAAABXYgI45jcZAouSSjIIjDkI4HwTJBIALvLBIFUY4xAPhoA1ZAcAjIRI2RQlFCkIIMR6PxEC0UiYXDt3WMSdOFz0w+prTb6DHeMNPd9LN7n9WjtGwjdnIzcGeGIn5aI3WMglFbWY14kHKLR4AMkZKEb2ebDF18fUchACH5BAkKAAEALAAAAAAUABQAAAV6YCCO44GQKOkw40CIxZuKi9KIwyAK8hwkCpyOIPCNFglWTjEojAgJkeMmUixIhiABADhIGw3HwycACLyqsI+ATo2NqCmY6puH5WC43QHvjxx8M3KBUnJGgyIPYIGEAVMjaiJ0j3lTjTN5eQGadWqainQpgJJ0b36jPiEAIfkECQoAAQAsAAAAABQAFAAABXVgII7jwpAo+TxjkoiGkY5OwwauSBTz2DSinIHQozUcuISCIIMpRDUfcoRYBAwCwQH6c9xSBAEBgapNUwfy7Fs0/oBFgBwwqL3bcwCvzYeey10qdkV2Uw+BAX9RIkc+RgE/iY1tkZGSlI2Wgz0OU5YBbG2dRSEAIfkECQoACAAsAAAAABQAFAAABXcgIo4j05Ao+TjjsohuOjoNi8RIoshjDb+KBG/mczUUL9EhSevZYKwDgSBE0GoPXmFgqBKfqIMXlR2iro3TMCBgF9BqXpt9MKPGJAeYRAhw81dDAwAAAyIPaTZgTSIChiJxTWlWPmaTk5SWPpiBPHqQcWV2VnskIQAh+QQJCgABACwAAAAAFAAUAAAFemAgjqPjkCj5nGLTiAyTlg3rios8t/bLLDvayeXIjRYsx4tHcjwCi0RCp6w9Z4qEQifcxXbXYNN1Cw7Og0O1vEMTEGKUYmfaGQaEQ7O6WxQEAwUiD0QiLCIEAiMEBCNLAUoBNwcAA3E3ZQIAYoVllI10PSMHCXGGhykhACH5BAkKAAEALAAAAAAUABQAAAV3YCCOo+OQKPmcYtOIZlo2T/sGDSvjrBs4t90vh6MRYbXh6Igc0mAuRzIV1UGtpJhsKpy5grKEOLEAfrvjBKOLUuy0KQTBkMiadwsDYS56RGEkBwQjBQZLMwEAAAEIAoZdPooiBAKQRJKMAgVCWpgBB25sAQUDQiEAIfkECQoAEAAsAAAAABQAFAAABXsgJI6j45Ao+Zxi04hmWjZP+0INK+OsCzm33S+HoxFhteHoiBzSYC5HMhXVQa2kmGwqnLmCsm8O+O2KseadNrVQKBhZsnqRSChEj6iIQEIURm5LIwMBCAIBEAkDB10QAAIQAYgQBnxChyKYiQSMOwKQEJ8jCQuNIgd/OyEAIfkECQoAHwAsAAAAABQAFAAABXzgJ46j45Ao+Zxi04hmWjZP+34NK+Os+zm33S+HoxFhteHoiBzSYC5HMhXVQa2kmGwqnLmCsm8O+O2KsV0u6UDYAbWigwAg2K2iIgMAMPgsDCQMCkssCW0iBQMKA30MCQtdHwNtjCILCV0EfZKbDY9CBAUimiMMaDIIgDshACH5BAkKAB8ALAAAAAAUABQAAAV44CeOo+OQKPmcYtOIZlo2T/t+DSvjrPs5t90vh6MRYbXh6Igc0mAuRzIV1UGtpJhsKhwVAGBA1xUdhMVCMrMr4pIQhx1QK0IQBITdKio6CAQFHwsIWUFHCoEiBgQKCQlDWCkEgY5QXQV5H5WQQgWJmx8PbjsMC0IhACH5BAkKAB8ALAAAAAAUABQAAAV14CeOo+OQKPmcYtO0bwo/cC3b7pffotOcrsevRPsMBKMh8eNrFAcBwEBxczlRUMLNdEvwUgWAGPC1/gZjMs9c/I7aqMRh62KJEoZB4bay3gkEcw4LJD5JMQtzIgsKfj52XVQ7OzcKVDoxQjEyCoSYb3A8XDchACH5BAEKAB8ALAAAAAAUABQAAAV64CeOo+OQKJkcY9OIZjoSAPu5Ii6LgJC/jtdONKjdGo/GCfYQEQYjAYHkaAaVosJgUFjsXDHS07ALpxTDFOK5TbvAh217+MamSU0Zg1FWLkUMCgloMg9XSwwJCV6GVEI3Sw5eMEg4QX9fJzo6X0I6SZgoYZwPeXdmKSEAOw\x3D\x3D);\n\tbackground-position: center center;\n\tbackground-repeat: no-repeat\n}\nh1:lang(as)\x2C h1:lang(bh)\x2C h1:lang(bho)\x2C h1:lang(bn)\x2C h1:lang(gu)\x2C h1:lang(hi)\x2C h1:lang(kn)\x2C h1:lang(ml)\x2C h1:lang(mr)\x2C h1:lang(my)\x2C h1:lang(or)\x2C h1:lang(pa)\x2C h1:lang(sa)\x2C h1:lang(ta)\x2C h1:lang(te) {\n\tline-height: 1.6em !important\n}\nh2:lang(as)\x2C h3:lang(as)\x2C h4:lang(as)\x2C h5:lang(as)\x2C h6:lang(as)\x2C h2:lang(bho)\x2C h3:lang(bho)\x2C h4:lang(bho)\x2C h5:lang(bho)\x2C h6:lang(bho)\x2C h2:lang(bh)\x2C h3:lang(bh)\x2C h4:lang(bh)\x2C h5:lang(bh)\x2C h6:lang(bh)\x2C h2:lang(bn)\x2C h3:lang(bn)\x2C h4:lang(bn)\x2C h5:lang(bn)\x2C h6:lang(bn)\x2C h2:lang(gu)\x2C h3:lang(gu)\x2C h4:lang(gu)\x2C h5:lang(gu)\x2C h6:lang(gu)\x2C h2:lang(hi)\x2C h3:lang(hi)\x2C h4:lang(hi)\x2C h5:lang(hi)\x2C h6:lang(hi)\x2C h2:lang(kn)\x2C h3:lang(kn)\x2C h4:lang(kn)\x2C h5:lang(kn)\x2C h6:lang(kn)\x2C h2:lang(ml)\x2C h3:lang(ml)\x2C h4:lang(ml)\x2C h5:lang(ml)\x2C h6:lang(ml)\x2C h2:lang(mr)\x2C h3:lang(mr)\x2C h4:lang(mr)\x2C h5:lang(mr)\x2C h6:lang(mr)\x2C h2:lang(my)\x2C h3:lang(my)\x2C h4:lang(my)\x2C h5:lang(my)\x2C h6:lang(my)\x2C h2:lang(or)\x2C h3:lang(or)\x2C h4:lang(or)\x2C h5:lang(or)\x2C h6:lang(or)\x2C h2:lang(pa)\x2C h3:lang(pa)\x2C h4:lang(pa)\x2C h5:lang(pa)\x2C h6:lang(pa)\x2C h2:lang(sa)\x2C h3:lang(sa)\x2C h4:lang(sa)\x2C h5:lang(sa)\x2C h6:lang(sa)\x2C h2:lang(ta)\x2C h3:lang(ta)\x2C h4:lang(ta)\x2C h5:lang(ta)\x2C h6:lang(ta)\x2C h2:lang(te)\x2C h3:lang(te)\x2C h4:lang(te)\x2C h5:lang(te)\x2C h6:lang(te) {\n\tline-height: 1.2em\n}\nol:lang(bcc) li\x2C ol:lang(bqi) li\x2C ol:lang(fa) li\x2C ol:lang(glk) li\x2C ol:lang(kk-arab) li\x2C ol:lang(mzn) li {\n\tlist-style-type: -moz-persian;\n\tlist-style-type: persian\n}\nol:lang(ckb) li {\n\tlist-style-type: -moz-arabic-indic;\n\tlist-style-type: arabic-indic\n}\nol:lang(hi) li\x2C ol:lang(mr) li {\n\tlist-style-type: -moz-devanagari;\n\tlist-style-type: devanagari\n}\nol:lang(as) li\x2C ol:lang(bn) li {\n\tlist-style-type: -moz-bengali;\n\tlist-style-type: bengali\n}\nol:lang(or) li {\n\tlist-style-type: -moz-oriya;\n\tlist-style-type: oriya\n}\n#toc ul\x2C .toc ul {\n\tmargin: .3em 0\n}\n.mw-content-ltr .toc ul\x2C .mw-content-ltr #toc ul\x2C .mw-content-rtl .mw-content-ltr .toc ul\x2C .mw-content-rtl .mw-content-ltr #toc ul {\n\ttext-align: left\n}\n.mw-content-rtl .toc ul\x2C .mw-content-rtl #toc ul\x2C .mw-content-ltr .mw-content-rtl .toc ul\x2C .mw-content-ltr .mw-content-rtl #toc ul {\n\ttext-align: right\n}\n.mw-content-ltr .toc ul ul\x2C .mw-content-ltr #toc ul ul\x2C .mw-content-rtl .mw-content-ltr .toc ul ul\x2C .mw-content-rtl .mw-content-ltr #toc ul ul {\n\tmargin: 0 0 0 2em\n}\n.mw-content-rtl .toc ul ul\x2C .mw-content-rtl #toc ul ul\x2C .mw-content-ltr .mw-content-rtl .toc ul ul\x2C .mw-content-ltr .mw-content-rtl #toc ul ul {\n\tmargin: 0 2em 0 0\n}\n#toc #toctitle\x2C .toc #toctitle\x2C #toc .toctitle\x2C .toc .toctitle {\n\tdirection: ltr\n}\n.mw-help-field-hint {\n\tdisplay: none;\n\tmargin-left: 2px;\n\tmargin-bottom: -8px;\n\tpadding: 0 0 0 15px;\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhCwALALMAAP///01NTZOTk1lZWefn57i4uJSUlPPz82VlZdDQ0HFxcaysrNvb28TExAAAAAAAACH5BAAAAAAALAAAAAALAAsAAAQrUIRJqQQ455nNNBgHJANBDAwgZsVwqIG2IEQYYwXy2lq/Kg3NqqeSVCqCCAA7);\n\tbackground-position: left center;\n\tbackground-repeat: no-repeat;\n\tcursor: pointer;\n\tfont-size: .8em;\n\ttext-decoration: underline;\n\tcolor: #0645ad\n}\n.mw-help-field-hint:hover {\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhCwALALMAAAtop+7z+GCWwpW51oStz8rb6yZzrafF3bnR5Nzn8QBcoD91oABQmf///wAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjAyODAxMTc0MDcyMDY4MTE5NkQ0QUQzRjI0NzRCNUQwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjJBN0FFQTQwQjlGQzExREY5RDlBQTRBODQyMkJCMkFDIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjJBN0FFQTNGQjlGQzExREY5RDlBQTRBODQyMkJCMkFDIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzUgTWFjaW50b3NoIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RkM3RjExNzQwNzIwNjgxMTk1RkVBQ0ZBOEQxNTU5MkUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MDI4MDExNzQwNzIwNjgxMTk2RDRBRDNGMjQ3NEI1RDAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJuamZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2JhYF9eXVxbWllYV1ZVVFNSUVBPTk1MS0pJSEdGRURDQkFAPz49PDs6OTg3NjU0MzIxMC8uLSwrKikoJyYlJCMiISAfHh0cGxoZGBcWFRQTEhEQDw4NDAsKCQgHBgUEAwIBAAAh+QQAAAAAACwAAAAACwALAAAEK3CxSalsOOeZxRQY1yBKkihFI2aDEqiMRgBJGGMD8NpavxoHzaqnklQqiwgAOw\x3D\x3D);\n}\n.mw-help-field-data {\n\tdisplay: block;\n\tbackground-color: #d6f3ff;\n\tpadding: 5px 8px 4px 8px;\n\tborder: 1px solid #5dc9f4;\n\tmargin-left: 20px\n}\n.tipsy {\n\tpadding: 5px 5px 10px;\n\tfont-size: 12px;\n\tposition: absolute;\n\tz-index: 100000;\n\toverflow: visible\n}\n.tipsy-inner {\n\tpadding: 5px 8px 4px 8px;\n\tbackground-color: #d6f3ff;\n\tcolor: black;\n\tborder: 1px solid #5dc9f4;\n\tmax-width: 300px;\n\ttext-align: left\n}\n.tipsy-arrow {\n\tposition: absolute;\n\tbackground: url(data:image/gif;base64\x2CR0lGODlhDQANAMQAAPf399bz/9vu9m/O9NXy/8Pm9svp9pfd+YLW943X9LTn++z093XQ9WnM9OLw9p/c9YTU9InY9/T292DK9Jre+afj+rvq/Nzv9rjk9brl9cPt/ZLb+GbL9MLs/ZHb+KLh+iH5BAAAAAAALAAAAAANAA0AAAVK4BGMZBkcg2WW1lBEKxkVAFTFFQQAwkSYhIlgB3hQTJQHEbBodEiaxmIJyHhIGwwVIGEoAgqGZAswIAIIA3mX+CTWOwfHAd9dtiEAOw\x3D\x3D) no-repeat top left;\n\twidth: 13px;\n\theight: 13px\n}\n.tipsy-se .tipsy-arrow {\n\tbottom: -2px;\n\tright: 10px;\n\tbackground-position: 0% 100%\n}\n#mw-clearyourcache\x2C #mw-sitecsspreview\x2C #mw-sitejspreview\x2C #mw-usercsspreview\x2C #mw-userjspreview {\n\tdirection: ltr;\n\tunicode-bidi: embed\n}\n.diff-currentversion-title\x2C .diff {\n\tdirection: ltr;\n\tunicode-bidi: embed\n}\n.diff-contentalign-right td {\n\tdirection: rtl;\n\tunicode-bidi: embed\n}\n.diff-contentalign-left td {\n\tdirection: ltr;\n\tunicode-bidi: embed\n}\n.diff-otitle\x2C .diff-ntitle\x2C .diff-lineno {\n\tdirection: ltr !important;\n\tunicode-bidi: embed\n}\n#mw-revision-info\x2C #mw-revision-info-current\x2C #mw-revision-nav {\n\tdirection: ltr;\n\tdisplay: inline\n}\ndiv.tright\x2C div.floatright\x2C table.floatright {\n\tclear: right;\n\tfloat: right\n}\ndiv.tleft\x2C div.floatleft\x2C table.floatleft {\n\tfloat: left;\n\tclear: left\n}\ndiv.floatright\x2C table.floatright\x2C div.floatleft\x2C table.floatleft {\n\tposition: relative\n}\n#mw-credits a {\n\tunicode-bidi: embed\n}\n.mw-jump\x2C #jump-to-nav {\n\toverflow: hidden;\n\theight: 0;\n\tzoom: 1\n}\n.printfooter {\n\tdisplay: none\n}\n.xdebug-error {\n\tposition: absolute;\n\tz-index: 99\n}\n.editsection\x2C .toctoggle {\n\t-moz-user-select: none;\n\t-webkit-user-select: none;\n\t-ms-user-select: none;\n\tuser-select: none\n}\n}\n@media screen {\na {\n\ttext-decoration: none;\n\tcolor: #0645ad;\n\tbackground: none\n}\na:visited {\n\tcolor: #0b0080\n}\na:active {\n\tcolor: #faa700\n}\na:hover\x2C a:focus {\n\ttext-decoration: underline\n}\na.stub {\n\tcolor: #772233\n}\na.new\x2C #p-personal a.new {\n\tcolor: #ba0000\n}\na.new:visited\x2C #p-personal a.new:visited {\n\tcolor: #a55858\n}\n.mw-body a.extiw\x2C .mw-body a.extiw:active {\n\tcolor: #36b\n}\n.mw-body a.extiw:visited {\n\tcolor: #636\n}\n.mw-body a.extiw:active {\n\tcolor: #b63\n}\n.mw-body a.external {\n\tcolor: #36b\n}\n.mw-body a.external:visited {\n\tcolor: #636\n}\n.mw-body a.external:active {\n\tcolor: #b63\n}\nimg {\n\tborder: none;\n\tvertical-align: middle\n}\nhr {\n\theight: 1px;\n\tcolor: #aaa;\n\tbackground-color: #aaa;\n\tborder: 0;\n\tmargin: .2em 0\n}\nh1\x2C h2\x2C h3\x2C h4\x2C h5\x2C h6 {\n\tcolor: black;\n\tbackground: none;\n\tfont-weight: normal;\n\tmargin: 0;\n\toverflow: hidden;\n\tpadding-top: .5em;\n\tpadding-bottom: .17em;\n\tborder-bottom: 1px solid #aaa\n}\nh1 {\n\tfont-size: 188%\n}\nh1 .editsection {\n\tfont-size: 53%\n}\nh2 {\n\tfont-size: 150%\n}\nh2 .editsection {\n\tfont-size: 67%\n}\nh3\x2C h4\x2C h5\x2C h6 {\n\tborder-bottom: none;\n\tfont-weight: bold\n}\nh3 {\n\tfont-size: 132%\n}\nh3 .editsection {\n\tfont-size: 76%;\n\tfont-weight: normal\n}\nh4 {\n\tfont-size: 116%\n}\nh4 .editsection {\n\tfont-size: 86%;\n\tfont-weight: normal\n}\nh5 {\n\tfont-size: 100%\n}\nh5 .editsection {\n\tfont-weight: normal\n}\nh6 {\n\tfont-size: 80%\n}\nh6 .editsection {\n\tfont-size: 125%;\n\tfont-weight: normal\n}\nh1\x2C h2 {\n\tmargin-bottom: .6em\n}\nh3\x2C h4\x2C h5 {\n\tmargin-bottom: .3em\n}\np {\n\tmargin: .4em 0 .5em 0;\n\tline-height: 1.5em\n}\np img {\n\tmargin: 0\n}\nul {\n\tline-height: 1.5em;\n\tlist-style-type: square;\n\tmargin: .3em 0 0 1.6em;\n\tpadding: 0\n}\nol {\n\tline-height: 1.5em;\n\tmargin: .3em 0 0 3.2em;\n\tpadding: 0;\n\tlist-style-image: none\n}\nli {\n\tmargin-bottom: .1em\n}\ndt {\n\tfont-weight: bold;\n\tmargin-bottom: .1em\n}\ndl {\n\tmargin-top: .2em;\n\tmargin-bottom: .5em\n}\ndd {\n\tline-height: 1.5em;\n\tmargin-left: 1.6em;\n\tmargin-bottom: .1em\n}\nq {\n\tfont-family: Times\x2C \"Times New Roman\"\x2C serif;\n\tfont-style: italic\n}\npre\x2C code\x2C tt\x2C kbd\x2C samp\x2C .mw-code {\n\tfont-family: monospace\x2C Courier\n}\ncode {\n\tbackground-color: #f9f9f9\n}\npre\x2C .mw-code {\n\tpadding: 1em;\n\tborder: 1px dashed #2f6fab;\n\tcolor: black;\n\tbackground-color: #f9f9f9\n}\ntable {\n\tfont-size: 100%\n}\nfieldset {\n\tborder: 1px solid #2f6fab;\n\tmargin: 1em 0 1em 0;\n\tpadding: 0 1em 1em;\n\tline-height: 1.5em\n}\nfieldset.nested {\n\tmargin: 0 0 0.5em 0;\n\tpadding: 0 0.5em 0.5em\n}\nlegend {\n\tpadding: .5em;\n\tfont-size: 95%\n}\nform {\n\tborder: none;\n\tmargin: 0\n}\ntextarea {\n\twidth: 100%;\n\tpadding: .1em\n}\nselect {\n\tvertical-align: top\n}\n.center {\n\twidth: 100%;\n\ttext-align: center\n}\n*.center * {\n\tmargin-left: auto;\n\tmargin-right: auto\n}\n.small {\n\tfont-size: 94%\n}\ntable.small {\n\tfont-size: 100%\n}\n#toc\x2C .toc\x2C .mw-warning {\n\tborder: 1px solid #aaa;\n\tbackground-color: #f9f9f9;\n\tpadding: 5px;\n\tfont-size: 95%\n}\n#toc h2\x2C .toc h2 {\n\tdisplay: inline;\n\tborder: none;\n\tpadding: 0;\n\tfont-size: 100%;\n\tfont-weight: bold\n}\n#toc #toctitle\x2C .toc #toctitle\x2C #toc .toctitle\x2C .toc .toctitle {\n\ttext-align: center\n}\n#toc ul\x2C .toc ul {\n\tlist-style-type: none;\n\tlist-style-image: none;\n\tmargin-left: 0;\n\tpadding: 0;\n\ttext-align: left\n}\n#toc ul ul\x2C .toc ul ul {\n\tmargin: 0 0 0 2em\n}\n#toc .toctoggle\x2C .toc .toctoggle {\n\tfont-size: 94%\n}\n.toccolours {\n\tborder: 1px solid #aaa;\n\tbackground-color: #f9f9f9;\n\tpadding: 5px;\n\tfont-size: 95%\n}\n.mw-warning {\n\tmargin-left: 50px;\n\tmargin-right: 50px;\n\ttext-align: center\n}\ndiv.floatright\x2C table.floatright {\n\tmargin: 0 0 .5em .5em;\n\tborder: 0\n}\ndiv.floatright p {\n\tfont-style: italic\n}\ndiv.floatleft\x2C table.floatleft {\n\tmargin: 0 .5em .5em 0;\n\tborder: 0\n}\ndiv.floatleft p {\n\tfont-style: italic\n}\ndiv.thumb {\n\tmargin-bottom: .5em;\n\twidth: auto;\n\tbackground-color: transparent\n}\ndiv.thumbinner {\n\tborder: 1px solid #ccc;\n\tpadding: 3px !important;\n\tbackground-color: #f9f9f9;\n\tfont-size: 94%;\n\ttext-align: center;\n\toverflow: hidden\n}\nhtml .thumbimage {\n\tborder: 1px solid #ccc\n}\nhtml .thumbcaption {\n\tborder: none;\n\tline-height: 1.4em;\n\tpadding: 3px !important;\n\tfont-size: 94%\n}\ndiv.magnify {\n\tborder: none !important;\n\tbackground: none !important\n}\ndiv.magnify a\x2C div.magnify img {\n\tdisplay: block;\n\tborder: none !important;\n\tbackground: none !important\n}\ndiv.tright {\n\tmargin: .5em 0 1.3em 1.4em\n}\ndiv.tleft {\n\tmargin: .5em 1.4em 1.3em 0\n}\nimg.thumbborder {\n\tborder: 1px solid #dddddd\n}\n#userlogin\x2C #userloginForm {\n\tborder: solid 1px #cccccc;\n\tpadding: 1.2em;\n\tmargin: .5em;\n\tfloat: left\n}\n.catlinks {\n\tborder: 1px solid #aaa;\n\tbackground-color: #f9f9f9;\n\tpadding: 5px;\n\tmargin-top: 1em;\n\tclear: both\n}\n.usermessage {\n\tbackground-color: #ffce7b;\n\tborder: 1px solid #ffa500;\n\tcolor: black;\n\tfont-weight: bold;\n\tmargin: 2em 0 1em;\n\tpadding: .5em 1em;\n\tvertical-align: middle\n}\n#siteNotice {\n\tposition: relative;\n\ttext-align: center;\n\tmargin: 0\n}\n#localNotice {\n\tmargin-bottom: 0.9em\n}\n.firstHeading\x2C #firstHeading {\n\tmargin-bottom: .1em;\n\tline-height: 1.2em;\n\tpadding-bottom: 0\n}\n#siteSub {\n\tdisplay: none\n}\n#jump-to-nav {\n\tmargin-top: -1.4em;\n\tmargin-bottom: 1.4em\n}\n#contentSub\x2C #contentSub2 {\n\tfont-size: 84%;\n\tline-height: 1.2em;\n\tmargin: 0 0 1.4em 1em;\n\tcolor: #7d7d7d;\n\twidth: auto\n}\nspan.subpages {\n\tdisplay: block\n}\nhtml\x2C body {\n\theight: 100%;\n\tmargin: 0;\n\tpadding: 0;\n\tfont-family: sans-serif;\n\tfont-size: 1em\n}\nbody {\n\tbackground-color: #f3f3f3;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAAAAAA6fptVAAAACklEQVQIHWP4BgAA+AD3KTtPjAAAAABJRU5ErkJggg\x3D\x3D);\n}\ndiv#content {\n\tmargin-left: 10em;\n\tpadding: 1em;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVQIHWNYfv0nAASgAnhGoPmuAAAAAElFTkSuQmCC);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-y;\n\tbackground-color: white;\n\tcolor: black;\n\tdirection: ltr\n}\n#mw-page-base {\n\theight: 5em;\n\tbackground-color: white;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAsCAIAAAArRUU2AAAAOklEQVQIHQXBAQEAAAjDIFz/zhdsCyE0y4SQya2RCSGWaYQ2Hc3ahFiINTIh1ly3NRohEwuh0VmmER5oBCM5OFSTKwAAAABJRU5ErkJggg\x3D\x3D);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x\n}\n#mw-head-base {\n\tmargin-top: -5em;\n\tmargin-left: 10em;\n\theight: 5em;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVQIHWNYfv0nAASgAnhGoPmuAAAAAElFTkSuQmCC);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x\n}\ndiv#mw-head {\n\tposition: absolute;\n\ttop: 0;\n\tright: 0;\n\twidth: 100%\n}\ndiv#mw-head h5 {\n\tmargin: 0;\n\tpadding: 0\n}\ndiv.emptyPortlet {\n\tdisplay: none\n}\n#p-personal {\n\tposition: absolute;\n\ttop: 0.33em;\n\tright: 0.75em\n}\n#p-personal h5 {\n\tdisplay: none\n}\n#p-personal ul {\n\tlist-style: none;\n\tmargin: 0;\n\tpadding-left: 10em\n}\n#p-personal li {\n\tline-height: 1.125em;\n\tfloat: left\n}\n#p-personal li {\n\tmargin-left: 0.75em;\n\tmargin-top: 0.5em;\n\tfont-size: 0.75em;\n\twhite-space: nowrap\n}\n#left-navigation {\n\tposition: absolute;\n\tleft: 10em;\n\ttop: 2.5em\n}\n#right-navigation {\n\tfloat: right;\n\tmargin-top: 2.5em\n}\ndiv.vectorTabs h5\x2C div.vectorMenu h5 span {\n\tdisplay: none\n}\ndiv.vectorTabs {\n\tfloat: left;\n\theight: 2.5em\n}\ndiv.vectorTabs {\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR4XmVO0QqAQAwy//+P87QjGUf0IDo3ZZREAD84eXkZ5YDBRQcFwpXv3kW1N4/GmZXe326/xnf9ya8zzy/NtusBX91B1f55qzcAAAAASUVORK5CYII\x3D);\n\tbackground-position: bottom left;\n\tbackground-repeat: no-repeat;\n\tpadding-left: 1px\n}\ndiv.vectorTabs ul {\n\tfloat: left\n}\ndiv.vectorTabs ul {\n\theight: 100%;\n\tlist-style: none;\n\tmargin: 0;\n\tpadding: 0\n}\ndiv.vectorTabs ul li {\n\tfloat: left\n}\ndiv.vectorTabs ul li {\n\tline-height: 1.125em;\n\tdisplay: inline-block;\n\theight: 100%;\n\tmargin: 0;\n\tpadding: 0;\n\tbackground-color: #f3f3f3;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAABkCAIAAADITs03AAAAPElEQVR4XuWK2xEAIAzCsPvv5DSu0ahX3yv4wQVyGGCSvg2dnJvduT8sz/IwKOIfjCi2z/76FhHeJcslVZQFLUC06LZ/AAAAAElFTkSuQmCC);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x;\n\twhite-space: nowrap\n}\ndiv.vectorTabs ul > li {\n\tdisplay: block\n}\ndiv.vectorTabs li.selected {\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAABkAQAAAABvV2fNAAAADUlEQVQIHWNoYBgWEACJ5TIB0K9KcAAAAABJRU5ErkJggg\x3D\x3D);\n}\ndiv.vectorTabs li a {\n\tdisplay: inline-block;\n\theight: 1.9em;\n\tpadding-left: 0.5em;\n\tpadding-right: 0.5em;\n\tcolor: #0645ad;\n\tcursor: pointer;\n\tfont-size: 0.8em\n}\ndiv.vectorTabs li > a {\n\tdisplay: block\n}\ndiv.vectorTabs li.icon a {\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat\n}\ndiv.vectorTabs span a {\n\tdisplay: inline-block;\n\tpadding-top: 1.25em\n}\ndiv.vectorTabs span > a {\n\tfloat: left;\n\tdisplay: block\n}\ndiv.vectorTabs span {\n\tdisplay: inline-block;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR4XmVO0QqAQAwy//+P87QjGUf0IDo3ZZREAD84eXkZ5YDBRQcFwpXv3kW1N4/GmZXe326/xnf9ya8zzy/NtusBX91B1f55qzcAAAAASUVORK5CYII\x3D);\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat\n}\ndiv.vectorTabs li.selected a\x2C div.vectorTabs li.selected a:visited {\n\tcolor: #333;\n\ttext-decoration: none\n}\ndiv.vectorTabs li.new a\x2C div.vectorTabs li.new a:visited {\n\tcolor: #a55858\n}\ndiv.vectorMenu {\n\tdirection: ltr;\n\tfloat: left;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAABYAAAAQBAMAAADgw5IVAAAAD1BMVEXz+fuamprd3d15eXmxsbG+1Cf6AAAAAXRSTlMAQObYZgAAACZJREFUCFtjYKAaYBI2NjYWgnIUjY0NFRASMGGgBFwYKOEEZ5ILAABbAqkPJqHJAAAAAElFTkSuQmCC);\n\tbackground-position: 100% 60%;\n\tbackground-repeat: no-repeat;\n\tcursor: pointer\n}\ndiv.vectorMenuFocus {\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAABYAAAAQBAMAAADgw5IVAAAAD1BMVEWampqSkpKtra2/v7/j4+Mm0C2mAAAAAXRSTlMAQObYZgAAACZJREFUCFtjYKAaYFEUFBRUgXKcBAWFHBASMGGgBFwYKGECZ5ILANu8AllBO68YAAAAAElFTkSuQmCC);\n\tbackground-position: 100% 60%\n}\nbody.rtl div.vectorMenu {\n\tdirection: rtl\n}\ndiv#mw-head div.vectorMenu h5 {\n\tfloat: left;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR4XmVO0QqAQAwy//+P87QjGUf0IDo3ZZREAD84eXkZ5YDBRQcFwpXv3kW1N4/GmZXe326/xnf9ya8zzy/NtusBX91B1f55qzcAAAAASUVORK5CYII\x3D);\n\tbackground-repeat: no-repeat\n}\ndiv#mw-head div.vectorMenu h5 {\n\tbackground-position: bottom left;\n\tmargin-left: -1px\n}\ndiv#mw-head div.vectorMenu > h5 {\n\tbackground-image: none\n}\ndiv#mw-head div.vectorMenu h4 {\n\tdisplay: inline-block;\n\tfloat: left;\n\tfont-size: 0.8em;\n\tpadding-left: 0.5em;\n\tpadding-top: 1.375em;\n\tfont-weight: normal;\n\tborder: none\n}\ndiv.vectorMenu h5 a {\n\tdisplay: inline-block;\n\twidth: 24px;\n\theight: 2.5em;\n\ttext-decoration: none;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR4XmVO0QqAQAwy//+P87QjGUf0IDo3ZZREAD84eXkZ5YDBRQcFwpXv3kW1N4/GmZXe326/xnf9ya8zzy/NtusBX91B1f55qzcAAAAASUVORK5CYII\x3D);\n\tbackground-repeat: no-repeat\n}\ndiv.vectorMenu h5 a {\n\tbackground-position: bottom right\n}\ndiv.vectorMenu h5 > a {\n\tdisplay: block\n}\ndiv.vectorMenu div.menu {\n\tposition: relative;\n\tdisplay: none;\n\tclear: both;\n\ttext-align: left\n}\nbody.rtl div.vectorMenu div.menu {\n\tmargin-left: 24px\n}\nbody.rtl div.vectorMenu > div.menu {\n\tmargin-left: auto\n}\nbody.rtl div.vectorMenu > div.menu\x2C x:-moz-any-link {\nmargin-left:23px\n}\ndiv.vectorMenu:hover div.menu\x2C div.vectorMenu div.menuForceShow {\n\tdisplay: block\n}\ndiv.vectorMenu ul {\n\tposition: absolute;\n\tbackground-color: white;\n\tborder: solid 1px silver;\n\tborder-top-width: 0;\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tpadding: 0;\n\tmargin: 0;\n\tmargin-left: -1px;\n\ttext-align: left\n}\ndiv.vectorMenu ul\x2C x:-moz-any-link {\nmin-width:5em\n}\ndiv.vectorMenu ul\x2C x:-moz-any-link\x2C x:default {\nmin-width:0\n}\ndiv.vectorMenu li {\n\tpadding: 0;\n\tmargin: 0;\n\ttext-align: left;\n\tline-height: 1em\n}\ndiv.vectorMenu li a {\n\tdisplay: inline-block;\n\tpadding: 0.5em;\n\twhite-space: nowrap;\n\tcolor: #0645ad;\n\tcursor: pointer;\n\tfont-size: 0.8em\n}\ndiv.vectorMenu li > a {\n\tdisplay: block\n}\ndiv.vectorMenu li.selected a\x2C div.vectorMenu li.selected a:visited {\n\tcolor: #333;\n\ttext-decoration: none\n}\n#p-search h5 {\n\tdisplay: none\n}\n#p-search {\n\tfloat: left\n}\n#p-search {\n\tmargin-right: 0.5em;\n\tmargin-left: 0.5em\n}\n#p-search form\x2C #p-search input {\n\tmargin: 0;\n\tmargin-top: 0.4em\n}\ndiv#simpleSearch {\n\tdisplay: block;\n\twidth: 14em;\n\theight: 1.4em;\n\tmargin-top: 0.65em;\n\tposition: relative;\n\tmin-height: 1px;\n\tborder: solid 1px #aaa;\n\tcolor: black;\n\tbackground-color: white;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAQCAIAAABY/YLgAAAAJUlEQVQIHQXBsQEAAAjDoND/73UWdnerhmHVsDQZJrNWVg3Dqge6bgMe6bejNAAAAABJRU5ErkJggg\x3D\x3D);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-x\n}\ndiv#simpleSearch label {\n\tfont-size: 13px;\n\ttop: 0.25em;\n\tdirection: ltr\n}\ndiv#simpleSearch input {\n\tcolor: black;\n\tdirection: ltr\n}\ndiv#simpleSearch input:focus {\n\toutline: none\n}\ndiv#simpleSearch input.placeholder {\n\tcolor: #999\n}\ndiv#simpleSearch input::-webkit-input-placeholder {\ncolor:#999\n}\ndiv#simpleSearch input#searchInput {\n\tposition: absolute;\n\ttop: 0;\n\tleft: 0;\n\twidth: 90%;\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-left: 0.2em;\n\tpadding-top: 0.2em;\n\tpadding-bottom: 0.2em;\n\toutline: none;\n\tborder: none;\n\tfont-size: 13px;\n\tbackground-color: transparent;\n\tdirection: ltr\n}\ndiv#simpleSearch button#searchButton {\n\tposition: absolute;\n\twidth: 10%;\n\tright: 0;\n\ttop: 0;\n\tpadding: 0;\n\tpadding-top: 0.3em;\n\tpadding-bottom: 0.2em;\n\tpadding-right: 0.4em;\n\tmargin: 0;\n\tborder: none;\n\tcursor: pointer;\n\tbackground-color: transparent;\n\tbackground-image: none\n}\ndiv#simpleSearch button#searchButton img {\n\tborder: none;\n\tmargin: 0;\n\tmargin-top: -3px;\n\tpadding: 0\n}\ndiv#simpleSearch button#searchButton > img {\n\tmargin: 0\n}\ndiv#mw-panel {\n\tposition: absolute;\n\ttop: 160px;\n\tpadding-top: 1em;\n\twidth: 10em;\n\tleft: 0\n}\ndiv#mw-panel div.portal {\n\tpadding-bottom: 1.5em;\n\tdirection: ltr\n}\ndiv#mw-panel div.portal h5 {\n\tfont-weight: normal;\n\tcolor: #444;\n\tpadding: 0.25em;\n\tpadding-top: 0;\n\tpadding-left: 1.75em;\n\tcursor: default;\n\tborder: none;\n\tfont-size: 0.75em\n}\ndiv#mw-panel div.portal div.body {\n\tmargin: 0;\n\tpadding-top: 0.5em;\n\tmargin-left: 1.25em;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAIwAAAABCAAAAAAphRnkAAAAJ0lEQVQIW7XFsQEAIAyAMPD/b7uLWz8wS5youFW1UREfiIpH1Q2VBz7fGPS1dOGeAAAAAElFTkSuQmCC);\n\tbackground-repeat: no-repeat;\n\tbackground-position: top left\n}\ndiv#mw-panel div.portal div.body ul {\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tpadding: 0;\n\tmargin: 0\n}\ndiv#mw-panel div.portal div.body ul li {\n\tline-height: 1.125em;\n\tpadding: 0;\n\tpadding-bottom: 0.5em;\n\tmargin: 0;\n\tfont-size: 0.75em;\n\tword-wrap: break-word\n}\ndiv#mw-panel div.portal div.body ul li a {\n\tcolor: #0645ad\n}\ndiv#mw-panel div.portal div.body ul li a:visited {\n\tcolor: #0b0080\n}\ndiv#footer {\n\tmargin-left: 10em;\n\tmargin-top: 0;\n\tpadding: 0.75em;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVQIHWNYfv0nAASgAnhGoPmuAAAAAElFTkSuQmCC);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-x;\n\tdirection: ltr\n}\ndiv#footer ul {\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tmargin: 0;\n\tpadding: 0\n}\ndiv#footer ul li {\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-top: 0.5em;\n\tpadding-bottom: 0.5em;\n\tcolor: #333;\n\tfont-size: 0.7em\n}\ndiv#footer #footer-icons {\n\tfloat: right\n}\nbody.ltr div#footer #footer-places {\n\tfloat: left\n}\ndiv#footer #footer-info li {\n\tline-height: 1.4em\n}\ndiv#footer #footer-icons li {\n\tfloat: left;\n\tmargin-left: 0.5em;\n\tline-height: 2em;\n\ttext-align: right\n}\ndiv#footer #footer-places li {\n\tfloat: left;\n\tmargin-right: 1em;\n\tline-height: 2em\n}\n#p-logo {\n\tposition: absolute;\n\ttop: -160px;\n\tleft: 0;\n\twidth: 10em;\n\theight: 160px\n}\n#p-logo a {\n\tdisplay: block;\n\twidth: 10em;\n\theight: 160px;\n\tbackground-repeat: no-repeat;\n\tbackground-position: center center;\n\ttext-decoration: none\n}\n#preftoc {\n\twidth: 100%;\n\tfloat: left;\n\tclear: both;\n\tmargin: 0 !important;\n\tpadding: 0 !important;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAhCAMAAAAvZzGNAAAAYFBMVEUAAAD+/v79/f38/Pzt7e36+vr4+Pj39/f19fXz8/Py8vLw8PD7+/vq6uro6Ojm5ubl5eXj4+Ph4eHf39/d3d3b29vZ2dnY2NjW1tbU1NTT09PR0dHQ0NDPz8/Ozs7Nzc0koCh/AAAAAXRSTlMAQObYZgAAABtJREFUCFtjYmBiBENOpp9QFgT+ZGIAijEShgBszwJih9jAuAAAAABJRU5ErkJggg\x3D\x3D);\n\tbackground-position: bottom left;\n\tbackground-repeat: no-repeat\n}\n#preftoc li {\n\tfloat: left;\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-right: 1px;\n\theight: 2.25em;\n\twhite-space: nowrap;\n\tlist-style-type: none;\n\tlist-style-image: none;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAhCAMAAAAvZzGNAAAAYFBMVEUAAAD+/v79/f38/Pzt7e36+vr4+Pj39/f19fXz8/Py8vLw8PD7+/vq6uro6Ojm5ubl5eXj4+Ph4eHf39/d3d3b29vZ2dnY2NjW1tbU1NTT09PR0dHQ0NDPz8/Ozs7Nzc0koCh/AAAAAXRSTlMAQObYZgAAABtJREFUCFtjYmBiBENOpp9QFgT+ZGIAijEShgBszwJih9jAuAAAAABJRU5ErkJggg\x3D\x3D);\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat\n}\n#preftoc li:first-child {\n\tmargin-left: 1px\n}\n#preftoc a\x2C #preftoc a:active {\n\tdisplay: inline-block;\n\tposition: relative;\n\tcolor: #0645ad;\n\tpadding: 0.5em;\n\ttext-decoration: none;\n\tbackground-image: none;\n\tfont-size: 0.9em\n}\n#preftoc a:hover\x2C #preftoc a:focus {\n\ttext-decoration: underline\n}\n#preftoc li.selected a {\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAhCAQAAACysAk0AAAAHElEQVQIW2P6z8DE8J+JgQGKQFwMhCaIn4shCAC27Qc86OAoxwAAAABJRU5ErkJggg\x3D\x3D);\n\tbackground-position: bottom;\n\tbackground-repeat: repeat-x;\n\tcolor: #333;\n\ttext-decoration: none\n}\n#preferences {\n\tfloat: left;\n\twidth: 100%;\n\tmargin: 0;\n\tmargin-top: -2px;\n\tclear: both;\n\tborder: solid 1px #ccc;\n\tbackground-color: #f9f9f9;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAAAAAA6fptVAAAACklEQVQIHWP4BQAA/AD7oRDZ1QAAAABJRU5ErkJggg\x3D\x3D);\n}\n#preferences fieldset {\n\tborder: none;\n\tborder-top: solid 1px #ccc\n}\n#preferences fieldset.prefsection {\n\tborder: none;\n\tpadding: 0;\n\tmargin: 1em\n}\n#preferences legend {\n\tcolor: #666\n}\n#preferences fieldset.prefsection legend.mainLegend {\n\tdisplay: none\n}\n#preferences td {\n\tpadding-left: 0.5em;\n\tpadding-right: 0.5em\n}\n.htmlform-tip {\n\tfont-size: x-small;\n\tpadding: .2em 2em;\n\tcolor: #666\n}\n#preferences div.mw-prefs-buttons {\n\tpadding: 1em\n}\n#preferences div.mw-prefs-buttons input {\n\tmargin-right: 0.25em\n}\ndiv#content {\n\tline-height: 1.5em\n}\n#bodyContent {\n\tfont-size: 1.25em\n}\n.editsection {\n\tfloat: right\n}\nul {\n\tlist-style-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAUAAAANAQMAAABb8jbLAAAABlBMVEX///8AUow5QSOjAAAAAXRSTlMAQObYZgAAABNJREFUCB1jYEABBQw/wLCAgQEAGpIDyT0IVcsAAAAASUVORK5CYII\x3D);\n}\npre\x2C .mw-code {\n\tline-height: 1.3em\n}\n#siteNotice {\n\tfont-size: 0.8em\n}\n#firstHeading {\n\tpadding-top: 0;\n\tmargin-top: 0;\n\tpadding-top: 0;\n\tfont-size: 1.6em\n}\ndiv#content a.external\x2C div#content a.external[href ^\x3D\"gopher://\"] {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAVklEQVR4Xn3PgQkAMQhDUXfqTu7kTtkpd5RA8AInfArtQ2iRXFWT2QedAfttj2FsPIOE1eCOlEuoWWjgzYaB/IkeGOrxXhqB+uA9Bfcm0lAZuh+YIeAD+cAqSz4kCMUAAAAASUVORK5CYII\x3D) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href ^\x3D\"https://\"]\x2C .link-https {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAdUlEQVQYV2P4//8/Awxv3LThf0dXKxyD+DA5DEUg+tWrV2AaWTFcIboJyJrhCtGtRMcgebhpL2/4/v//Lvn//x+7IRjIfn8v+P/t055gxZgKPzaC8Y/nMYQVLpnM8f/zo3AqKfzyOOL/h/sh/59c9sBUSIyvAeRdJWjk4E//AAAAAElFTkSuQmCC) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href ^\x3D\"mailto:\"]\x2C .link-mailto {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKBAMAAAB/HNKOAAAAMFBMVEX///////+IioX29vbq6unJx8O9vbvl5ePZ2NX7+/iysrLp5+KjoZyop6Oxrqrx8O1Uz2ohAAAAAXRSTlMAQObYZgAAAENJREFUCB1jYOBWKmBgYHASVGFgYFHsEXJgcJK4mqjCoL6oMM6JQXmxfKsRg+J0HWMhBkWrydlAMtLYVYghSUlJSQ0ATXALyH6+YqgAAAAASUVORK5CYII\x3D) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href ^\x3D\"news:\"] {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAe0lEQVR4Xo2QQQqAIBBFPbDXCKJTGCTRIqJN7qL2gp5BcOEpJmZgAlEp4eHiP/8Min7o4A8kfpxclFJmpJRAKVWIGNQoRHzNcBtSF6/7pDuEwDQbWaw20ijnPGGtffHOU0bitq9gzAExRmwqwGxeNAgAEJMeWx9Ne6PzAI3dPZAGO1zBAAAAAElFTkSuQmCC) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href ^\x3D\"ftp://\"]\x2C .link-ftp {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAQAAAAnOwc2AAAATElEQVR4XlXIQQrAIAwAwfzej/QtPqQUepBiqR68bWMghOzeRpCCf4DsDb26OfDk0quxo8KtN6AEGtEzNh5eRsbOx2RlHCw9YxSYR34KRKBV5WnY6QAAAABJRU5ErkJggg\x3D\x3D) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href ^\x3D\"irc://\"]\x2C div#content a.external[href ^\x3D\"ircs://\"]\x2C .link-irc {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAdElEQVR4Xn3QTQqAIBAFYC8fRNeKAjdlxxD/wf3UTGoo2sBbyPuQUbbtK8zLNAz2zzCG4GcQ11BKWUUp1YVYULTWlBDCEBIwxoC1dggxBJxz/R3FJfIho+rVnPMXok6woFMc4L2HGCOhAtt/a1GB6RYqRrkBKEFJ6m9q5RIAAAAASUVORK5CYII\x3D) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href $\x3D\".ogg\"]\x2C div#content a.external[href $\x3D\".OGG\"]\x2C div#content a.external[href $\x3D\".mid\"]\x2C div#content a.external[href $\x3D\".MID\"]\x2C div#content a.external[href $\x3D\".midi\"]\x2C div#content a.external[href $\x3D\".MIDI\"]\x2C div#content a.external[href $\x3D\".mp3\"]\x2C div#content a.external[href $\x3D\".MP3\"]\x2C div#content a.external[href $\x3D\".wav\"]\x2C div#content a.external[href $\x3D\".WAV\"]\x2C div#content a.external[href $\x3D\".wma\"]\x2C div#content a.external[href $\x3D\".WMA\"]\x2C .link-audio {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKBAMAAAB/HNKOAAAAMFBMVEX///91fyrI0Xt5gzPCzGuyv0bw8eubomu3u5qQlWafo4HV25q3w1CLljOEjjKRlHTuBCtpAAAAAXRSTlMAQObYZgAAADdJREFUCFtjYGgUFBRnYBBSUlJkYDCCkIKCIFKAEUZmiohNdGRYs/XW6VgGkbhC1xcMjB8Y5BMA6nkLTrUjfj0AAAAASUVORK5CYII\x3D) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href $\x3D\".ogm\"]\x2C div#content a.external[href $\x3D\".OGM\"]\x2C div#content a.external[href $\x3D\".avi\"]\x2C div#content a.external[href $\x3D\".AVI\"]\x2C div#content a.external[href $\x3D\".mpeg\"]\x2C div#content a.external[href $\x3D\".MPEG\"]\x2C div#content a.external[href $\x3D\".mpg\"]\x2C div#content a.external[href $\x3D\".MPG\"]\x2C .link-video {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAAAAACoWZBhAAAAAnRSTlMA/1uRIrUAAABbSURBVAgdBcGxCQBBCARAWxeMBUOb2NzI7EAQW3iuDoP7GXp7TMTOPlp4fV85lkbHOaN1yCrhyV5GchHdwBWSy94duEJWEUjnMhodKCJ1aOHVXwmW3h4TsVT+AXinRvdYoWa2AAAAAElFTkSuQmCC) center right no-repeat;\n\tpadding-right: 13px\n}\ndiv#content a.external[href $\x3D\".pdf\"]\x2C div#content a.external[href $\x3D\".PDF\"]\x2C div#content a.external[href *\x3D\".pdf#\"]\x2C div#content a.external[href *\x3D\".PDF#\"]\x2C div#content a.external[href *\x3D\".pdf\?\"]\x2C div#content a.external[href *\x3D\".PDF\?\"]\x2C .link-document {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAQAAAAnOwc2AAAATklEQVR4XmXKQQqAMAwF0X/7XsSz9CSKiyIIFRFcjMmihmiGbB5fqDCaQJ4j46pzYLUWe+cXZ6OVBhTS0srY2Njp/+XxXXZOLu6EUWAOPX1vnwTBe6qQAAAAAElFTkSuQmCC) center right no-repeat;\n\tpadding-right: 13px\n}\n#pt-userpage\x2C #pt-anonuserpage\x2C #pt-login {\n\tbackground: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAoAAAANCAMAAACn6Q83AAABMlBMVEUAAAAXMVgVL1QAFSvHgRbLiRrOiBnZn0LIghW/gBDXli6/gBW/gBXhp03Zly6/gADXnT25dBfBfA7anT3fnDLGgRf/AAC4hDDCijEvW5RZdZEoU5JEcqw/aaAoSog9Z53MZgA1XZM8ZZjHgxM7X5I0WIsyWIsZNVY3W407ZJk7YpgzV4kbOmYWL1FfdIgrVpAVL1MwYJzpuGs0Z6cuXJSrq6g3bbK1sahMd6s4aKbnsVzmrlbgmi02aak2a603bbGOqs6ovNTlr1syY6A3ZZ/uxorx0aEwXpkzZqVUfbBykbcyY6HenDPjoz/hnTLhnjU0YJcxYZ01ZJ5NdKQvXpgtUX/fmCjgmSnjqU7ioTs8ZZk7ZZk6ZJk7ZJfqvHVPfbGuhUHUljPTlTPswX6zhz/qvHQOItQnAAAAMXRSTlMAfIMMW04+1WIQ2Qww+dwEzQsl+P1DAd7gkvlN9usttwWo1VLRwMU+2/3+3ktS8mVWPq+4awAAAIRJREFUCB0FwU0LAVEYhuHnft8zhzMWPtIkiiwtlLK2sfUD/PMxCSsp2QlZjI/rckndOma15FKsV8vT9ytTO9/6fpO1ZPp8MpaP9UBBkd37SYWCAn0aHJq3IKdnPy8QI4az0uAMkzHAvcMxeM6tIL+4m6frOKXkUwtWkYBXGSWfY8bC9Qc4kh0uE5k18QAAAABJRU5ErkJggg\x3D\x3D) left top no-repeat;\n\tpadding-left: 15px !important;\n\ttext-transform: none\n}\n.redirectText {\n\tfont-size: 140%\n}\n.redirectMsg img {\n\tvertical-align: text-bottom\n}\n#bodyContent {\n\tposition: relative;\n\twidth: 100%\n}\ndiv#bodyContent {\n\tline-height: 1.5em\n}\n.skin-vector #mw-notification-area {\n\ttop: 7em;\n\tfont-size: 0.8em\n}\n.skin-vector .mw-notification {\n\tbackground-color: #fff;\n\tbackground-color: rgba(255\x2C255\x2C255\x2C0.93);\n\tpadding: 0.75em 1.5em;\n\tborder: solid 1px #a7d7f9;\n\tborder-radius: 0.75em;\n\t-webkit-box-shadow: 0 2px 10px 0 rgba(0\x2C0\x2C0\x2C0.125);\n\t-moz-box-shadow: 0 2px 10px 0 rgba(0\x2C0\x2C0\x2C0.125);\n\tbox-shadow: 0 2px 10px 0 rgba(0\x2C0\x2C0\x2C0.125)\n}\n#ca-unwatch.icon a\x2C #ca-watch.icon a {\n\tmargin: 0;\n\tpadding: 0;\n\toutline: none;\n\tdisplay: block;\n\twidth: 26px;\n\tpadding-top: 3.1em;\n\tmargin-top: 0;\nmargin-top:-0.8em !ie;\n\theight: 0;\n\toverflow: hidden;\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAFgAAAAQCAMAAAClQEgHAAADAFBMVEXz+fv///91w/+t3P/G0NOh2v/N2evy/v665f/O7P7O8f/C5f+FuuePtcGW1v+O0f6g1v/a1cvCsnHx45T5+vzKwq2+rGN5xP/f2s/6+vme1v+b1P+HzP+W0v9zwf+Uv86+rXT+/uuFxPTEsmWi3f/Y8v+z3/+Y1//k1IuZ2v9xxP/JtmTo7POJw+664v/C7f+xx+F+tuPj5ufq7e2Ktsbs8fl9zP/R3vDD6v/Ny4v1/v+Gy/+zz6utvcKJxPLU7v+Ou87Wz768zJShydqUsrx3xf//+9WUyvS02Oqn3v+j3frZ6M3i9v/Nw3uw3f+98/+Erb7It4iSuuLbx2uIrbqCteJxw/++5v+Lzv/K1NXt/P+9rWi/soaxqZDPzMZsvv/r6ufy8O319vdovf/+/f3x7+qt3/++tqTy8vDf2czIslD29vWq2v/8/Pu+rnfBs4hnu/+Rz/9uwP/V0s3n03fo5uGk1//HwK7Pu2nk3tPRybb57ave2tPDsnaDyf/5+Pb6//+ozt/J4czO2ark9Py7q3T9/f78/f2SwPCTwdC0xMfd+f+R0f+W0unFvmjR3Oyc0PqyxdvO6fmt2u7b4OHn6+zP2dp2uvHV4vP58szv/P/DvXP//M+AzP/x5avC0pP2+fyNs8J/u+zU3em5rW16tejU7e2q19bA5fnVxXl0wf++2bLbynx8tdHh5/H16ar///zP1NvOvGjAs4/l5rnv//+erbHLvGj///l+uufCtI/09fb6+/vO3PC93c/a8fmv3P/z9ficyuWw3/+our3BrnOHt+KR1/+24v3Numje2dDW7+THysv7/PySr7r68saSoqrp//+gyt/G5/zFtXCou9KHu+rw8/eW0Pp3w/+/s2DHt2rBsW388bKTyO/29/fMuGh+rL/B0+rJ5NzS8f3//eTG6fmLs7/HztfT2avWxHOYrcLd2dDP1deYu+D///q5zujMumrs7u7//Nzt6+jJ9P/7/P6a1//17bnNwm3t7OjAxca7ycz4+fmn2f/19PM9fBugAAAAAXRSTlMAQObYZgAAAjxJREFUeF6101OMLEEYhuH+h8batm3b9h7btm3btm3btm3bmJ6amu2a9En25nxXnTdP/tRNU9r92EyxrnYT9v70UjW9fEIQKzTs2JS1y5yvVMuf3ANn2VyHr2trsfV14ZtesPqNQtLnA/Rje1oNgJUtWHpJtktafTY/QpKj8zuDJp/OBuibz5v0i1D1um04A+Bg36xRK6KHTH0tlfqKZbtCPuv57VllvosPIX9wWFL6+EpQTyhOT7KTY2XSdZn77FS6f1jj/vxdAe7+sWljueFludy9ooyrsT5Dq3xOxLMsUS6X+2BAxIwbBVRgPDB2nodh3WPMXmSAu7ejUCx1bdlZpbKyUkluC3T+7jk/0QFNVyjyvqn9jieRgBc/kdLNotcjnN94darqxpfjXH9b2rTrbctx3raa6U80Rr0087rGnyoeiA5EBgdSzLWehrqD00eiHz6qsik3a9teGeBN+v6Wmj7K9DsK7/ejAw95FLE/Raj3MCD7Pke+NadBnWtKgZ4f7UF3z2jsXy1FB6bHkLCnEeqpJmRfoLTmcFKWm7n56/nEWZxST9uUJdjHVALEXQCAZBJ2mQnQwwhga02yj8uIchtZ/iWKX6jnd4ceiU70CM3EPhlcgn9WFD+GeSRsA7e8El7aG8FNshdK+PPvjylR+AXo+U8rnBKOD5qTt1Ab7tkNpztPvuoOAU3Xd6e7wcXmFkRf5POW7gLZFGPSb0HeUOuHVOCfE33gNTTH98z7MPvgMHwvbO4//f/bX94WpZENI84pAAAAAElFTkSuQmCC);\n}\n#ca-unwatch.icon a {\n\tbackground-position: -43px 60%\n}\n#ca-watch.icon a {\n\tbackground-position: 5px 60%\n}\n#ca-unwatch.icon a:hover\x2C #ca-unwatch.icon a:focus {\n\tbackground-position: -67px 60%\n}\n#ca-watch.icon a:hover\x2C #ca-watch.icon a:focus {\n\tbackground-position: -19px 60%\n}\n#ca-unwatch.icon a.loading\x2C #ca-watch.icon a.loading {\n\tbackground-image: url(data:image/gif;base64\x2CR0lGODlhEAAQAMQfANra2uLi4vDw8PLy8ujo6Ozs7NbW1vj4+Pb29s7Oztzc3NTU1O7u7uDg4NHR0erq6v39/d7e3vz8/Pv7+/7+/tPT09jY2Pr6+tnZ2efn5/X19eXl5ebm5vT09P///////yH/C05FVFNDQVBFMi4wAwEAAAAh+QQJAwAfACwAAAAAEAAQAAAFa+Anjl9QkShacVqabp2XuKjjecHhStrjHDdIgtORiCyWSEZwud0mg0zEUhkYnNhsY/O5OCRZrEEwgvzCkgqZhGiEB1wUgRGeAFKApqcjcJ5QCx4aFQEECX1/JAlJJBsVFRMkEBkXLhyVNJkhACH5BAkDAB8ALAAAAAAQABAAAAV74CeO4hUQZEoGhqGqWzQtEnlYRCYMGSB5BkTKQCgUOBGPkjBIdQDKqBLhaJI4D6l0gylMRg6IVkmhNBIjxWBM8XAwHNFAIdYWDA0SRhNtKy0CJAUVEAcRAQJkFikZDg4EBB0RDR4dGCkIEhAjFBsBDwovKo0BoioFQiMhACH5BAkDAB8ALAAAAAAQABAAAAWB4CeO5HeU33OVl5IIpYEFh/QR1rYNZSMUAYVBwfBYbKRJwwPxFDxQjAbloECvHgMEBUBgPZTApjSxeL+eQGDUsQwkaGhBcUBYinGI5GBIEBwEGhxwVwwLFgoRHQwECgIADRFXBgUfEygfEBEDTmuYIxAJFAYwnyMFABVbpiMYGSghACH5BAkDAB8ALAAAAAAQABAAAAV+4CdKjWieKOJs6De1U5Zhg4YcmaG0kXcElQDtEWkZPMgMBGlofQDIqK9pmhAADClSEDBtAICJROvR7EQGx5LsgQAOogKm0LhQ2IDRQRJRFKIHAh4XAXknEw5REQsRBgAOEigRFBQEERofAgJiKBoZAgsXTicUDgYDoygNXU4hACH5BAUDAB8ALAAAAAAQABAAAAV54Cd+EFBNY6p+hgCssOERGwSP3eZBgUIEG0xhdGFpPMjChjNoRD6XIGBDQVo9FIcogZnsrlbLQNRQfMEewVN0ERAaaE9AoDoECGj76lBBTxQwDlYBEQweGwwqEDIHCwIbBgAAFioUBgUOdCIaBRwrBhUHNykQY6MfIQA7);\n\tbackground-position: 5px 60%\n}\n#ca-unwatch.icon a span\x2C #ca-watch.icon a span {\n\tdisplay: none\n}\ndiv.vectorTabs ul {\n\tbackground-image: url(data:image/png;base64\x2CiVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR4XmVO0QqAQAwy//+P87QjGUf0IDo3ZZREAD84eXkZ5YDBRQcFwpXv3kW1N4/GmZXe326/xnf9ya8zzy/NtusBX91B1f55qzcAAAAASUVORK5CYII\x3D);\n\tbackground-position: right bottom;\n\tbackground-repeat: no-repeat\n}\n.tipsy {\n\tfont-size: 0.8em\n}\n}\n@media screen and (min-width:982px) {\ndiv#content {\n\tmargin-left: 11em;\n\tpadding: 1.25em 1.5em 1.5em 1.5em\n}\n#p-logo {\n\tleft: 0.5em\n}\ndiv#footer {\n\tmargin-left: 11em;\n\tpadding: 1.25em\n}\n#mw-panel {\n\tpadding-left: 0.5em\n}\n#p-search {\n\tmargin-right: 1em\n}\n#left-navigation {\n\tleft: 11em\n}\n#p-personal {\n\tright: 1em\n}\n#mw-head-base {\n\tmargin-left: 11em\n}\n}\n/* cache key: realwiki-docs:resourceloader:filter:minify-css:7:583ca920fa73b62465a836363ed4b26c */\n\n/*\n * Any rules which should not be flipped automatically in right-to-left situations should be\n * prepended with @noflip in a comment block. Images that should be embedded as base64 data-URLs\n * should be prepended with @embed in a comment block.\n *\n * This style-sheet employs a few CSS trick to accomplish compatibility with a wide range of web\n * browsers. The most common trick is to use some styles in IE6 only. This is accomplished by using\n * a rule that makes things work in IE6\x2C and then following it with a rule that begins with\n * \"html > body\" or use a child selector \">\"\x2C which is ignored by IE6 because it does not support\n * the child selector. You can spot this by looking for the \"OVERRIDDEN BY COMPLIANT BROWSERS\" and\n * \"IGNORED BY IE6\" comments.\n */\n\n/* Framework */\nhtml\x2C body {\n\theight: 100%;\n\tmargin: 0;\n\tpadding: 0;\n\tfont-family: sans-serif;\n\tfont-size: 1em;\n}\nbody {\n\tbackground-color: #f3f3f3;\n\t/* @embed */\n\tbackground-image: url(images/page-base.png);\n}\n/* Content */\ndiv#content {\n\tmargin-left: 10em;\n\tpadding: 1em;\n\t/* @embed */\n\tbackground-image: url(images/border.png);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-y;\n\tbackground-color: white;\n\tcolor: black;\n\tdirection: ltr;\n}\n/* Head */\n#mw-page-base {\n\theight: 5em;\n\tbackground-color: white;\n\t/* @embed */\n\tbackground-image: url(images/page-fade.png);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x;\n}\n#mw-head-base {\n\tmargin-top: -5em;\n\tmargin-left: 10em;\n\t/* height: 5em; */\n\t/* @embed */\n\tbackground-image: url(images/border.png);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x;\n}\ndiv#mw-head {\n\tposition: absolute;\n\ttop: 0;\n\tright: 0;\n\twidth: 100%;\n}\ndiv#mw-head h5 {\n\tmargin: 0;\n\tpadding: 0;\n}\n/* Hide empty portlets */\ndiv.emptyPortlet {\n\tdisplay: none;\n}\n/* Personal */\n#p-personal {\n\tposition: absolute;\n\ttop: 0.33em;\n\tright: 0.75em;\n}\n#p-personal h5 {\n\tdisplay: none;\n}\n#p-personal ul {\n\tlist-style: none;\n\tmargin: 0;\n\tpadding-left: 10em; /* Keep from overlapping logo */\n}\n/* @noflip */\n#p-personal li {\n\tline-height: 1.125em;\n\tfloat: left;\n}\n/* This one flips! */\n#p-personal li {\n\tmargin-left: 0.75em;\n\tmargin-top: 0.5em;\n\tfont-size: 0.75em;\n\twhite-space: nowrap;\n}\n/* Navigation Containers */\n#left-navigation {\n\tposition: absolute;\n\tleft: 10em;\n\ttop: 2.5em;\n}\n#right-navigation {\n\tfloat: right;\n\tmargin-top: 2.5em;\n}\n/* Navigation Labels */\ndiv.vectorTabs h5\x2C div.vectorMenu h5 span {\n\tdisplay: none;\n}\n/* Namespaces and Views */\n/* @noflip */\ndiv.vectorTabs {\n\tfloat: left;\n\theight: 2.5em;\n}\ndiv.vectorTabs {\n\t/* @embed */\n\tbackground-image: url(images/tab-break.png);\n\tbackground-position: bottom left;\n\tbackground-repeat: no-repeat;\n\tpadding-left: 1px;\n}\n/* @noflip */\ndiv.vectorTabs ul {\n\tfloat: left;\n}\ndiv.vectorTabs ul {\n\theight: 100%;\n\tlist-style: none;\n\tmargin: 0;\n\tpadding: 0;\n}\n/* @noflip */\ndiv.vectorTabs ul li {\n\tfloat: left;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\ndiv.vectorTabs ul li {\n\tline-height: 1.125em;\n\tdisplay: inline-block;\n\theight: 100%;\n\tmargin: 0;\n\tpadding: 0;\n\tbackground-color: #f3f3f3;\n\t/* @embed */\n\tbackground-image: url(images/tab-normal-fade.png);\n\tbackground-position: bottom left;\n\tbackground-repeat: repeat-x;\n\twhite-space: nowrap;\n}\n/* IGNORED BY IE6 */\ndiv.vectorTabs ul > li {\n\tdisplay: block;\n}\ndiv.vectorTabs li.selected {\n\t/* @embed */\n\tbackground-image: url(images/tab-current-fade.png);\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\ndiv.vectorTabs li a {\n\tdisplay: inline-block;\n\theight: 1.9em;\n\tpadding-left: 0.5em;\n\tpadding-right: 0.5em;\n\tcolor: #0645ad;\n\tcursor: pointer;\n\tfont-size: 0.8em;\n}\n/* IGNORED BY IE6 */\ndiv.vectorTabs li > a {\n\tdisplay: block;\n}\ndiv.vectorTabs li.icon a {\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\ndiv.vectorTabs span a {\n\tdisplay: inline-block;\n\tpadding-top: 1.25em;\n}\n/* IGNORED BY IE6 */\n/* @noflip */\ndiv.vectorTabs span > a {\n\tfloat: left;\n\tdisplay: block;\n}\ndiv.vectorTabs span {\n\tdisplay: inline-block;\n\t/* @embed */\n\tbackground-image: url(images/tab-break.png);\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat;\n}\ndiv.vectorTabs li.selected a\x2C div.vectorTabs li.selected a:visited {\n\tcolor: #333;\n\ttext-decoration: none;\n}\ndiv.vectorTabs li.new a\x2C div.vectorTabs li.new a:visited {\n\tcolor: #a55858;\n}\n/* Variants and Actions */\n/* @noflip */\ndiv.vectorMenu {\n\tdirection: ltr;\n\tfloat: left;\n\t/* @embed */\n\tbackground-image: url(images/arrow-down-icon.png);\n\tbackground-position: 100% 60%;\n\tbackground-repeat: no-repeat;\n\tcursor: pointer;\n}\ndiv.vectorMenuFocus {\n\t/* @embed */\n\tbackground-image: url(images/arrow-down-focus-icon.png);\n\tbackground-position: 100% 60%;\n}\n/* @noflip */\nbody.rtl div.vectorMenu {\n\tdirection: rtl;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\n/* @noflip */\ndiv#mw-head div.vectorMenu h5 {\n\tfloat: left;\n\t/* @embed */\n\tbackground-image: url(images/tab-break.png);\n\tbackground-repeat: no-repeat;\n}\n/* This will be flipped - unlike the one above it */\ndiv#mw-head div.vectorMenu h5 {\n\tbackground-position: bottom left;\n\tmargin-left: -1px;\n}\n/* IGNORED BY IE6 */\ndiv#mw-head div.vectorMenu > h5 {\n\tbackground-image: none;\n}\ndiv#mw-head div.vectorMenu h4 {\n\tdisplay: inline-block;\n\tfloat: left;\n\tfont-size: 0.8em;\n\tpadding-left: 0.5em;\n\tpadding-top: 1.375em;\n\tfont-weight: normal;\n\tborder: none;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\n/* @noflip */\ndiv.vectorMenu h5 a {\n\tdisplay: inline-block;\n\twidth: 24px;\n\theight: 2.5em;\n\ttext-decoration: none;\n\t/* @embed */\n\tbackground-image: url(images/tab-break.png);\n\tbackground-repeat: no-repeat;\n}\n/* This will be flipped - unlike the one above it */\ndiv.vectorMenu h5 a {\n\tbackground-position: bottom right;\n}\n/* IGNORED BY IE6 */\ndiv.vectorMenu h5 > a {\n\tdisplay: block;\n}\ndiv.vectorMenu div.menu {\n\tposition: relative;\n\tdisplay: none;\n\tclear: both;\n\ttext-align: left;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\n/* @noflip */\nbody.rtl div.vectorMenu div.menu {\n\tmargin-left: 24px;\n}\n/* IGNORED BY IE6 */\n/* @noflip */\nbody.rtl div.vectorMenu > div.menu {\n\tmargin-left: auto;\n}\n/* IGNORED BY IE6 */\n/* Also fixes old versions of FireFox */\n/* @noflip */\nbody.rtl div.vectorMenu > div.menu\x2C x:-moz-any-link {\n margin-left: 23px;\n}\n/* Enable forcing showing of the menu for accessibility */\ndiv.vectorMenu:hover div.menu\x2C div.vectorMenu div.menuForceShow {\n\tdisplay: block;\n}\ndiv.vectorMenu ul {\n\tposition: absolute;\n\tbackground-color: white;\n\tborder: solid 1px silver;\n\tborder-top-width: 0;\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tpadding: 0;\n\tmargin: 0;\n\tmargin-left: -1px;\n\ttext-align: left;\n}\n/* Fixes old versions of FireFox */\ndiv.vectorMenu ul\x2C x:-moz-any-link {\n min-width: 5em;\n}\n/* Returns things back to normal in modern versions of FireFox */\ndiv.vectorMenu ul\x2C x:-moz-any-link\x2C x:default {\n min-width: 0;\n}\ndiv.vectorMenu li {\n\tpadding: 0;\n\tmargin: 0;\n\ttext-align: left;\n\tline-height: 1em;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\ndiv.vectorMenu li a {\n\tdisplay: inline-block;\n\tpadding: 0.5em;\n\twhite-space: nowrap;\n\tcolor: #0645ad;\n\tcursor: pointer;\n\tfont-size: 0.8em;\n}\n/* IGNORED BY IE6 */\ndiv.vectorMenu li > a {\n\tdisplay: block;\n}\ndiv.vectorMenu li.selected a\x2C div.vectorMenu li.selected a:visited {\n\tcolor: #333;\n\ttext-decoration: none;\n}\n/* Search */\n#p-search h5 {\n\tdisplay: none;\n}\n/* @noflip */\n#p-search {\n\tfloat: left;\n}\n#p-search {\n\tmargin-right: 0.5em;\n\tmargin-left: 0.5em;\n}\n#p-search form\x2C #p-search input {\n\tmargin: 0;\n\tmargin-top: 0.4em;\n}\ndiv#simpleSearch {\n\tdisplay: block;\n\twidth: 14em;\n\theight: 1.4em;\n\tmargin-top: 0.65em;\n\tposition: relative;\n\tmin-height: 1px; /* Gotta trigger hasLayout for IE7 */\n\tborder: solid 1px #aaa;\n\tcolor: black;\n\tbackground-color: white;\n\t/* @embed */\n\tbackground-image: url(images/search-fade.png);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-x;\n}\ndiv#simpleSearch label {\n\t/*\n\t * DON\'T PANIC! Browsers that won\'t scale this properly are the same browsers that have JS issues that prevent\n\t * this from ever being shown anyways.\n\t*/\n\tfont-size: 13px;\n\ttop: 0.25em;\n\tdirection: ltr;\n}\ndiv#simpleSearch input {\n\tcolor: black;\n\tdirection: ltr;\n}\ndiv#simpleSearch input:focus {\n\toutline: none;\n}\ndiv#simpleSearch input.placeholder {\n\tcolor: #999;\n}\ndiv#simpleSearch input::-webkit-input-placeholder {\n color: #999;\n}\ndiv#simpleSearch input#searchInput {\n\tposition: absolute;\n\ttop: 0;\n\tleft: 0;\n\twidth: 90%;\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-left: 0.2em;\n\tpadding-top: 0.2em;\n\tpadding-bottom: 0.2em;\n\toutline: none;\n\tborder: none;\n\t/*\n\t * DON\'T PANIC! Browsers that won\'t scale this properly are the same browsers that have JS issues that prevent\n\t * this from ever being shown anyways.\n\t*/\n\tfont-size: 13px;\n\tbackground-color: transparent;\n\tdirection: ltr;\n}\ndiv#simpleSearch button#searchButton {\n\tposition: absolute;\n\twidth: 10%;\n\tright: 0;\n\ttop: 0;\n\tpadding: 0;\n\tpadding-top: 0.3em;\n\tpadding-bottom: 0.2em;\n\tpadding-right: 0.4em;\n\tmargin: 0;\n\tborder: none;\n\tcursor: pointer;\n\tbackground-color: transparent;\n\tbackground-image: none;\n}\n/* OVERRIDDEN BY COMPLIANT BROWSERS */\ndiv#simpleSearch button#searchButton img {\n\tborder: none;\n\tmargin: 0;\n\tmargin-top: -3px;\n\tpadding: 0;\n}\n/* IGNORED BY IE6 */\ndiv#simpleSearch button#searchButton > img {\n\tmargin: 0;\n}\n/* Panel */\ndiv#mw-panel {\n\tposition: absolute;\n\ttop: 160px;\n\tpadding-top: 1em;\n\twidth: 10em;\n\tleft: 0;\n}\ndiv#mw-panel div.portal {\n\tpadding-bottom: 1.5em;\n\tdirection: ltr;\n}\ndiv#mw-panel div.portal h5 {\n\tfont-weight: normal;\n\tcolor: #444;\n\tpadding: 0.25em;\n\tpadding-top: 0;\n\tpadding-left: 1.75em;\n\tcursor: default;\n\tborder: none;\n\tfont-size: 0.75em;\n}\ndiv#mw-panel div.portal div.body {\n\tmargin: 0;\n\tpadding-top: 0.5em;\n\tmargin-left: 1.25em;\n\t/* @embed */\n\tbackground-image: url(images/portal-break.png);\n\tbackground-repeat: no-repeat;\n\tbackground-position: top left;\n}\ndiv#mw-panel div.portal div.body ul {\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tpadding: 0;\n\tmargin: 0;\n}\ndiv#mw-panel div.portal div.body ul li {\n\tline-height: 1.125em;\n\tpadding: 0;\n\tpadding-bottom: 0.5em;\n\tmargin: 0;\n\tfont-size: 0.75em;\n\tword-wrap: break-word;\n}\ndiv#mw-panel div.portal div.body ul li a {\n\tcolor: #0645ad;\n}\ndiv#mw-panel div.portal div.body ul li a:visited {\n\tcolor: #0b0080;\n}\n/* Footer */\ndiv#footer {\n\tmargin-left: 10em;\n\tmargin-top: 0;\n\tpadding: 0.75em;\n\t/* @embed */\n\tbackground-image: url(images/border.png);\n\tbackground-position: top left;\n\tbackground-repeat: repeat-x;\n\tdirection: ltr;\n}\ndiv#footer ul {\n\tlist-style: none;\n\tlist-style-image: none;\n\tlist-style-type: none;\n\tmargin: 0;\n\tpadding: 0;\n}\ndiv#footer ul li {\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-top: 0.5em;\n\tpadding-bottom: 0.5em;\n\tcolor: #333;\n\tfont-size: 0.7em;\n}\ndiv#footer #footer-icons {\n\tfloat: right;\n}\n/* @noflip */\nbody.ltr div#footer #footer-places {\n\tfloat: left;\n}\ndiv#footer #footer-info li {\n\tline-height: 1.4em;\n}\ndiv#footer #footer-icons li {\n\tfloat: left;\n\tmargin-left: 0.5em;\n\tline-height: 2em;\n\ttext-align: right;\n}\ndiv#footer #footer-places li {\n\tfloat: left;\n\tmargin-right: 1em;\n\tline-height: 2em;\n}\n/* Logo */\n#p-logo {\n\tposition: absolute;\n\ttop: -160px;\n\tleft: 0;\n\twidth: 10em;\n\theight: 160px;\n}\n#p-logo a {\n\tdisplay: block;\n\twidth: 10em;\n\theight: 160px;\n\tbackground-repeat: no-repeat;\n\tbackground-position: center center;\n\ttext-decoration: none;\n}\n/*\n *\n * The following code is highly modified from monobook. It would be nice if the\n * preftoc id was more human readable like preferences-toc for instance\x2C\n * howerver this would require backporting the other skins.\n */\n\n/* Preferences */\n#preftoc {\n\t/* Tabs */\n\twidth: 100%;\n\tfloat: left;\n\tclear: both;\n\tmargin: 0 !important;\n\tpadding: 0 !important;\n\t/* @embed */\n\tbackground-image: url(images/preferences-break.png);\n\tbackground-position: bottom left;\n\tbackground-repeat: no-repeat;\n}\n#preftoc li {\n\t/* Tab */\n\tfloat: left;\n\tmargin: 0;\n\tpadding: 0;\n\tpadding-right: 1px;\n\theight: 2.25em;\n\twhite-space: nowrap;\n\tlist-style-type: none;\n\tlist-style-image: none;\n\t/* @embed */\n\tbackground-image: url(images/preferences-break.png);\n\tbackground-position: bottom right;\n\tbackground-repeat: no-repeat;\n}\n/* Sadly\x2C IE6 won\'t understand this */\n#preftoc li:first-child {\n\tmargin-left: 1px;\n}\n#preftoc a\x2C  #preftoc a:active {\n\tdisplay: inline-block;\n\tposition: relative;\n\tcolor: #0645ad;\n\tpadding: 0.5em;\n\ttext-decoration: none;\n\tbackground-image: none;\n\tfont-size: 0.9em;\n}\n#preftoc a:hover\x2C  #preftoc a:focus {\n\ttext-decoration: underline;\n}\n#preftoc li.selected a {\n\t/* @embed */\n\tbackground-image: url(images/preferences-fade.png);\n\tbackground-position: bottom;\n\tbackground-repeat: repeat-x;\n\tcolor: #333;\n\ttext-decoration: none;\n}\n#preferences {\n\tfloat: left;\n\twidth: 100%;\n\tmargin: 0;\n\tmargin-top: -2px;\n\tclear: both;\n\tborder: solid 1px #ccc;\n\tbackground-color: #f9f9f9;\n\t/* @embed */\n\tbackground-image: url(images/preferences-base.png);\n}\n#preferences fieldset {\n\tborder: none;\n\tborder-top: solid 1px #ccc;\n}\n#preferences fieldset.prefsection {\n\tborder: none;\n\tpadding: 0;\n\tmargin: 1em;\n}\n#preferences legend {\n\tcolor: #666;\n}\n#preferences fieldset.prefsection legend.mainLegend {\n\tdisplay: none;\n}\n#preferences td {\n\tpadding-left: 0.5em;\n\tpadding-right: 0.5em;\n}\n.htmlform-tip {\n\tfont-size: x-small;\n\tpadding: .2em 2em;\n\tcolor: #666;\n}\n#preferences div.mw-prefs-buttons {\n\tpadding: 1em;\n}\n#preferences div.mw-prefs-buttons input {\n\tmargin-right: 0.25em;\n}\n/**\n * The following code is slightly modified from monobook\n */\ndiv#content {\n\tline-height: 1.5em;\n}\n#bodyContent {\n\tfont-size: 1.25em;\n}\n.editsection {\n\tfloat: right;\n}\nul {\n\t/* @embed */\n\tlist-style-image: url(images/bullet-icon.png);\n}\npre\x2C .mw-code {\n\tline-height: 1.3em;\n}\n/* Site Notice (includes notices from CentralNotice extension) */\n#siteNotice {\n\tfont-size: 0.8em;\n}\n#firstHeading {\n\tpadding-top: 0;\n\tmargin-top: 0;\n\tpadding-top: 0;\n\tfont-size: 1.6em;\n}\ndiv#content a.external\x2C div#content a.external[href ^\x3D\"gopher://\"] {\n\t/* @embed */\n\tbackground: url(images/external-link-ltr-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href ^\x3D\"https://\"]\x2C .link-https {\n\t/* @embed */\n\tbackground: url(images/lock-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href ^\x3D\"mailto:\"]\x2C .link-mailto {\n\t/* @embed */\n\tbackground: url(images/mail-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href ^\x3D\"news:\"] {\n\t/* @embed */\n\tbackground: url(images/news-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href ^\x3D\"ftp://\"]\x2C .link-ftp {\n\t/* @embed */\n\tbackground: url(images/file-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href ^\x3D\"irc://\"]\x2C div#content a.external[href ^\x3D\"ircs://\"]\x2C .link-irc {\n\t/* @embed */\n\tbackground: url(images/talk-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href $\x3D\".ogg\"]\x2C div#content a.external[href $\x3D\".OGG\"]\x2C div#content a.external[href $\x3D\".mid\"]\x2C div#content a.external[href $\x3D\".MID\"]\x2C div#content a.external[href $\x3D\".midi\"]\x2C div#content a.external[href $\x3D\".MIDI\"]\x2C div#content a.external[href $\x3D\".mp3\"]\x2C div#content a.external[href $\x3D\".MP3\"]\x2C div#content a.external[href $\x3D\".wav\"]\x2C div#content a.external[href $\x3D\".WAV\"]\x2C div#content a.external[href $\x3D\".wma\"]\x2C div#content a.external[href $\x3D\".WMA\"]\x2C .link-audio {\n\t/* @embed */\n\tbackground: url(images/audio-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href $\x3D\".ogm\"]\x2C div#content a.external[href $\x3D\".OGM\"]\x2C div#content a.external[href $\x3D\".avi\"]\x2C div#content a.external[href $\x3D\".AVI\"]\x2C div#content a.external[href $\x3D\".mpeg\"]\x2C div#content a.external[href $\x3D\".MPEG\"]\x2C div#content a.external[href $\x3D\".mpg\"]\x2C div#content a.external[href $\x3D\".MPG\"]\x2C .link-video {\n\t/* @embed */\n\tbackground: url(images/video-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\ndiv#content a.external[href $\x3D\".pdf\"]\x2C div#content a.external[href $\x3D\".PDF\"]\x2C div#content a.external[href *\x3D\".pdf#\"]\x2C div#content a.external[href *\x3D\".PDF#\"]\x2C div#content a.external[href *\x3D\".pdf\?\"]\x2C div#content a.external[href *\x3D\".PDF\?\"]\x2C .link-document {\n\t/* @embed */\n\tbackground: url(images/document-icon.png) center right no-repeat;\n\tpadding-right: 13px;\n}\n/* Icon for Usernames */\n#pt-userpage\x2C #pt-anonuserpage\x2C #pt-login {\n\t/* @embed */\n\tbackground: url(images/user-icon.png) left top no-repeat;\n\tpadding-left: 15px !important;\n\ttext-transform: none;\n}\n.redirectText {\n\tfont-size: 140%;\n}\n.redirectMsg img {\n\tvertical-align: text-bottom;\n}\n#bodyContent {\n\tposition: relative;\n\twidth: 100%;\n}\ndiv#bodyContent {\n\tline-height: 1.5em;\n}\n/* mediawiki.notification */\n.skin-vector #mw-notification-area {\n\ttop: 7em;\n\tfont-size: 0.8em;\n}\n.skin-vector .mw-notification {\n\tbackground-color: #fff;\n\tbackground-color: rgba(255\x2C 255\x2C 255\x2C 0.93);\n\tpadding: 0.75em 1.5em;\n\tborder: solid 1px #a7d7f9;\n\tborder-radius: 0.75em;\n\t-webkit-box-shadow: 0 2px 10px 0 rgba(0\x2C 0\x2C 0\x2C 0.125);\n\t-moz-box-shadow: 0 2px 10px 0 rgba(0\x2C 0\x2C 0\x2C 0.125);\n\tbox-shadow: 0 2px 10px 0 rgba(0\x2C 0\x2C 0\x2C 0.125);\n}\n/* Watch/Unwatch Icon Styling */\n#ca-unwatch.icon a\x2C #ca-watch.icon a {\n\tmargin: 0;\n\tpadding: 0;\n\toutline: none;\n\tdisplay: block;\n\twidth: 26px;\n\t/* This hides the text but shows the background image */\n\tpadding-top: 3.1em;\n\tmargin-top: 0;\n\t/* Only applied in IE6 */\n\tmargin-top: -0.8em !ie;\n\theight: 0;\n\toverflow: hidden;\n\t/* @embed */\n\tbackground-image: url(images/watch-icons.png);\n}\n#ca-unwatch.icon a {\n\tbackground-position: -43px 60%;\n}\n#ca-watch.icon a {\n\tbackground-position: 5px 60%;\n}\n#ca-unwatch.icon a:hover\x2C #ca-unwatch.icon a:focus {\n\tbackground-position: -67px 60%;\n}\n#ca-watch.icon a:hover\x2C #ca-watch.icon a:focus {\n\tbackground-position: -19px 60%;\n}\n#ca-unwatch.icon a.loading\x2C #ca-watch.icon a.loading {\n\t/* @embed */\n\tbackground-image: url(images/watch-icon-loading.gif);\n\tbackground-position: 5px 60%;\n}\n#ca-unwatch.icon a span\x2C #ca-watch.icon a span {\n\tdisplay: none;\n}\ndiv.vectorTabs ul {\n\t/* @embed */\n\tbackground-image: url(images/tab-break.png);\n\tbackground-position: right bottom;\n\tbackground-repeat: no-repeat;\n}\n/* Tooltips are outside of the normal body code\x2C so this helps make the size of the text sensible */\n.tipsy {\n\tfont-size: 0.8em;\n}\n\n/* Left Side */\n\n#ca-talk\x2C #ca-nstab-category\x2C #ca-nstab-main {\n\tdisplay: none !important;\n}\n/*Right Side*/\n#ca-view\x2C #ca-viewsource\x2C #ca-history {\n\tdisplay: none !important;\n}\n/* Login */\n\n#p-personal {\n\tdisplay: none !important;\n}\n/* Footer */\n#footer {\n\tdisplay: none !important;\n}\n/* Navigation */\n#n-currentevents\x2C #n-recentchanges\x2C #p-tb {\n\tdisplay: none !important;\n}\n/* Entire search bar */\ndiv#p-search {\n\tdisplay: none !important;\n}\ndiv#siteSub {\n\tdisplay: none !important;\n}\ndiv#jump-to-nav {\n\tdisplay: none !important;\n}\ndiv.printfooter {\n\tdisplay: none !important;\n}\n\n#historyTable {\nborder: 1px solid #999;\n}\n\n#historyTable tr.historyTableEvenRow td {\nbackground-color: #EEF;\n}\n</style>\n</head>\n<body style\x3D\"background-color: #FFF\" >\n<!-- content --><!-- /content -->\n</body>\n</html>\n", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events HTMLViewer1
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  // System.debuglog CurrentMethodName + " " + url
		  
		  Const cancelLoad = True
		  Const allowload = False
		  
		  Select Case  True
		    
		  Case url.beginswith("about:blank") 
		    // "about:blank" - do not cancel and allow this to load
		    Return allowload
		    
		  Case url.beginswith("xojo://")
		    // newer versions use 
		    // xojo://<name>
		    
		    // strip off xojo://
		    Dim tmpURL As String = url.Mid(Len("xojo://")+1)
		    
		    mOneShotTimer.mode = Timer.ModeSingle
		    mDBKeyToLoad = tmpURL
		    
		    Return cancelLoad
		    
		  Else
		    
		    #If TargetMacOS
		      
		      If url.BeginsWith("applewebdata://") Then
		        // strip off applewebdata:// <GUID> /
		        
		        // find the remainder in the DB
		        // and if found show that page
		        // and cancel the load
		        
		        // applewebdata://E713BCD8-C6E6-42B1-86C3-D54CF1CCF65D/UserGuide:Constant_Editor cancel or show some info saying "this is not local" return true
		        // applewebdata://FA00A5BC-AB78-4E22-8CD0-41F75192FC6C/Const.html      allow and look up right page and show it
		        // applewebdata://32776D4A-E53D-4E9A-B29B-55744F28085F/Dictionary.html 
		        // applewebdata://9F4E5C37-7D89-408C-9CFD-A8F948A1596C/index.php/Database_Class
		        // applewebdata://9F4E5C37-7D89-408C-9CFD-A8F948A1596C/index.php/Thread
		        
		        Dim tmpURL As String = url.Mid(Len("applewebdata://")+1)
		        Dim parts() As String = tmpurl.Split("/")
		        
		        If parts.Ubound > 0 Then
		          
		          tmpUrl = parts(1).Replace(".html", "")
		          
		          mOneShotTimer.mode = Timer.ModeSingle
		          mDBKeyToLoad = tmpURL
		          
		        End If
		        
		        Return cancelLoad
		        
		      End If
		    #EndIf
		    
		    If url.BeginsWith("http://") Or url.BeginsWith("https://") Then
		      // http://developer.xojo.com/userguide/variables-and-constants$constants - cancel show "not local" ?
		      // we could ASK if they want to open this or not ?
		      
		      MsgBox "The url '" + url + "' is not local"
		      
		      Return cancelLoad
		      
		    ElseIf url.BeginsWith("/") Then
		      
		      Dim tmpURL As String = url
		      
		      While tmpURL.Left(1) = "/" And url <> ""
		        
		        tmpURL = tmpURL.Mid(2)
		      Wend
		      
		      mOneShotTimer.mode = Timer.ModeSingle
		      mDBKeyToLoad = tmpURL
		      
		      Return allowload
		      
		    End If
		    
		  End Select
		  
		End Function
	#tag EndEvent
	#tag Event
		Function NewWindow(url as String) As HTMLViewer
		  #Pragma unused url
		  
		  break
		End Function
	#tag EndEvent
	#tag Event
		Sub DocumentComplete(url as String)
		  // System.debuglog CurrentMethodName + " " + url
		  // 
		  // DumpUrlStack
		  
		  pbBack.Enabled = urlIndex > 0 And urlStack.ubound > 0
		  pbFwd.Enabled = urlIndex < urlstack.ubound And urlStack.Ubound > 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Sub ExpandRow(row As Integer)
		  
		  dim whatType as string = me.cell(row, 0)
		  
		  dim rs as recordset = mDB.sqlselect("select id, title from cached_descriptions where type = '" + Trim(whatType) + "'")
		  
		  while rs <> nil and rs.eof <> true
		    
		    me.addrow rs.field("title").StringValue
		    me.rowtag(me.lastindex) = rs.field("id").Int64Value
		    
		    rs.movenext
		    
		  wend
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  Select Case True
		    
		  case me.listindex < 0
		    
		  case me.rowtag(me.listindex) <> nil and me.rowtag(me.listindex).Type = Variant.TypeInt64
		    
		    // ok look up the right source html and show that
		    
		    ShowPageWithID( Me.rowtag(Me.listindex).int64Value )
		    
		  end select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub TextChange()
		  if me.Text = "" then
		    reloadlistbox
		  else
		    loadsearchresults()
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events mOneShotTimer
	#tag Event
		Sub Action()
		  If mDBKeyToLoad <> "" Then
		    
		    ShowPageWithName( mDBKeyToLoad )
		    
		    mDBKeyToLoad = ""
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbBack
	#tag Event
		Sub Action()
		  MoveBackInStack
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbFwd
	#tag Event
		Sub Action()
		  MoveForwardInStack
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
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
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
