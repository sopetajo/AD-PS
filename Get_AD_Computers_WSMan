##########################################################################
#Lists Computers in the directory where you could open PSSession remotely#
##########################################################################

#List Domain computers:
$DirSearcher = New-Object System.DirectoryServices.DirectorySearcher([adsi]'')
$DirSearcher.Filter = '(objectClass=Computer)'
$ComputerNames = $DirSearcher.FindAll().GetEnumerator() |
                    ForEach-Object { $_.Properties.name }

#Check those for which the WSMan service is up
$ComputerNames = $ComputerNames | where{ try { Test-WSMan $_ }
                                            catch { return $false }
                                        }

return $ComputerNames
