# Get the user and role definition you want to link
$displayName = "Application Registration Creator"
$user = Get-MgUser -Filter "userPrincipalName eq 'testuser01@ashleyhollisoutlook.onmicrosoft.com'"
$roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq '$displayName'"

# Get resource scope for assignment
$resourceScope = '/'

# Create a scoped role assignment
$roleAssignment = New-MgRoleManagementDirectoryRoleAssignment -DirectoryScopeId $resourceScope -RoleDefinitionId $roleDefinition.Id -PrincipalId $user.Id
