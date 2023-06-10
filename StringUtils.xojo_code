#tag Module
Protected Module StringUtils
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit))
		Function BeginsWith(extends s as String, starts as string) As boolean
		  return s.Left(Len(starts)) = starts
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EditDistance(s1 As String, s2 As String) As Integer
		  // Return the Levenshein distance, aka the edit distance,
		  // between the two StringUtils.  That's the number of insertions,
		  // deletions, or changes required to make one string match the other.
		  // A result of 0 means the strings
		  // are identical; higher values mean more different.
		  
		  // Note that this function is case-sensitive; if you want a case-
		  // insensitive measure, simply Uppercase or Lowercase both strings
		  // before calling.
		  
		  // Implementation adapted from <http://www.merriampark.com/ld.htm>,
		  // though we're using only a 1D array since the 2D array is wasteful.
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  Dim n, m As Integer
		  n = s1.Len
		  m = s2.Len
		  If n = 0 Then 
		    Return m
		  End If
		  If m = 0 Then 
		    Return n
		  End If
		  
		  Dim i, j, cost As Integer
		  Dim d(-1) As Integer
		  Redim d(m)
		  for j = 1 to m
		    d(j) = j
		  next
		  
		  Dim s1chars(-1), s2chars(-1) As String
		  s1chars = Split( s1, "" )
		  s2chars = Split( s2, "" )
		  
		  Dim s1char As String
		  Dim lastCost, nextCost As Integer
		  Dim a, b, c As Integer
		  Dim jMinus1 As Integer
		  
		  for i = 1 to n
		    s1char = s1chars(i-1)
		    lastCost = i
		    jMinus1 = 0
		    for j = 1 to m
		      If StrComp(s1char, s2chars(jMinus1),0) = 0 Then 
		        cost = 0 
		      Else 
		        cost = 1
		      End If
		      
		      // set nextCost to the minimum of the following three possibilities:
		      a = d(j) + 1
		      b = lastCost + 1
		      c = cost + d(jMinus1)
		      
		      if a < b then
		        If c < a Then 
		          nextCost = c 
		        Else 
		          nextCost = a
		        End If
		      else
		        If c < b Then 
		          nextCost = c 
		        Else 
		          nextCost = b
		        End If
		      end if
		      
		      d(jMinus1) = lastCost
		      lastCost = nextCost
		      jMinus1 = j
		    next
		    d(m) = lastCost
		  next
		  
		  return nextCost
		  
		  
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
