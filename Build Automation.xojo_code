#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyFiles1
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vWG9qb0xhbmdSZWZEQiUyMDIwMTlyMS4x
					FolderItem = Li4vWG9qb0xhbmdSZWZEQiUyMDIwMjByMi4x
					FolderItem = Li4vWG9qb0xhbmdSZWZEQiUyMDIwMjFyMy4x
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
