<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen Id="CR3030PL" Type="SimpleScreen" DisplayName="Business Accounts" Icon="system://Culture" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <sm:Container Name="Result" FieldsToShow="5" ContainerActionsToExpand="1" ListActionsToExpand="1" UseOptimizedExport="true">
		<sm:Field Name="BusinessAccountName"/>
		<sm:Field Name="CountryName"/>
		<sm:Field Name="Type"/>
		<sm:Field Name="City"/>
		<sm:Field Name="BusinessAccount"/>
        
        <sm:Action Behavior="Create" Context="Container" Name="Insert" Icon="system://Plus" Redirect="true"/>
        <sm:Action Behavior="Open" Context="Container" Name="EditDetail" Redirect="true"/>
    </sm:Container>
</sm:Screen>
