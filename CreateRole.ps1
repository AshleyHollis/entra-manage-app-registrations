# Basic role information
$displayName = "Application Registration Creator"
$description = "Can create an unlimited number of application registrations."
$templateId = (New-Guid).Guid

# Set of permissions to grant
$allowedResourceAction =
@(
  "microsoft.directory/applications/create",
  "microsoft.directory/applications/createAsOwner",
  "microsoft.directory/servicePrincipals/allProperties/read",
  "microsoft.directory/servicePrincipals/create",
  "microsoft.directory/servicePrincipals/managePermissionGrantsForAll.microsoft-application-admin"
)
$rolePermissions = @{'allowedResourceActions' = $allowedResourceAction }

# Create new custom admin role
$roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq '$displayName'"
if (-not $roleDefinition) {
  Write-Host "Creating role."
  $customRole = New-MgRoleManagementDirectoryRoleDefinition -RolePermissions $rolePermissions -DisplayName $displayName -Description $description -TemplateId $templateId -IsEnabled
}
else {
  Write-Host "Updating role."
  Update-MgRoleManagementDirectoryRoleDefinition -UnifiedRoleDefinitionId $roleDefinition.Id -RolePermissions $rolePermissions -DisplayName $displayName -Description $description -IsEnabled
}
