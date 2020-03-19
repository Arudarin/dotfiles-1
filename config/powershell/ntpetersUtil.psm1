# Only import the module once.
If (Get-Module ntpetersUtil) {
    return
}

$Script:ScriptDirectory = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

. $Script:ScriptDirectory\functions\Export-Variable.ps1
. $Script:ScriptDirectory\functions\Invoke-Exa.ps1
. $Script:ScriptDirectory\functions\Show-Colors.ps1

Export-ModuleMember -Alias export, exa, colors -Function 'Export-Variable', 'Invoke-Exa', 'Show-Colors'

# Load Windows only functions.
If ($Global:IsWindows) {
    . $Script:ScriptDirectory\functions\Invoke-XLaunch.ps1
    . $Script:ScriptDirectory\functions\Test-Administrator.ps1

    Export-ModuleMember -Alias startx, isadmin -Function 'Invoke-XLaunch', 'Test-Administrator'
}
