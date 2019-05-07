Function Get-Enum {
  <#
  .SYNOPSIS
    Finds the enum for a .Net object
  .DESCRIPTION
    This script finds the enumeration for a .Net class
  .EXAMPLE
    Get-Enum -TypeClass 'System.ServiceProcess.ServiceControllerStatus'
    This will inspect the class and determine what values are associated 
    with the names in the Enumeration
  .PARAMETER TypeClass
    This needs to be a string that includes the entire name of the class 
    wrapped in ' ' without entering the square brackets 
  .NOTES
    General notes
    Created by: Brent Denny
    When:       long ago
    Added help : 7-May-2019
  #>
  [cmdletbinding()]
  Param (
    [Parameter(Mandatory=$true)]
    [string]$TypeClass
  )
  $EnumNum = [enum]::GetValues($TypeClass).Value__
  $EnumStr = [enum]::GetNames($TypeClass)
  foreach ($Index in (0..($EnumNum.count - 1))) {
    $NewObjProps = [ordered]@{
      Number = $EnumNum[$Index]
      Name   = $EnumStr[$Index]
    }
    New-Object -TypeName psobject -Property $NewObjProps
  }
}