$subScriptionName = "Development"
$context = Get-AzContext
if ( !$context )
{
    Connect-AzAccount
}
if ( $context.Subscription.Name -ne $subScriptionName )
{
    Set-AzContext -Subscription "$subScriptionName"
}
Set-AzContext -Subscription "$subScriptionName"
Test-AzResourceGroupDeployment -ResourceGroupName "dev-thirdlight-southcentral" -TemplateFile "master.template.json" -TemplateParameterFile "thirdlight-parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName "dev-thirdlight-southcentral" -TemplateFile "master.template.json" -TemplateParameterFile "thirdlight-parameters.json"