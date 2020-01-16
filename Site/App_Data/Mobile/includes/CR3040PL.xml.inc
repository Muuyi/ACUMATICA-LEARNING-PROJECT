<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen Id="CR3040PL" Type="SimpleScreen" DisplayName="Opportunities" Icon="system://Culture" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <sm:Container Name="Result" FieldsToShow="6" ContainerActionsToExpand="1" ListActionsToExpand="1" UseOptimizedExport="true">
		<sm:Field Name="Subject"/>
		<sm:Field Name="OpportunityID"/>
		<sm:Field Name="CompanyName"/>
		<sm:Field Name="Currency"/>
		<sm:Field Name="Stage"/>
		<sm:Field Name="Amount"/>
        
        <sm:Action Behavior="Create" Context="Container" Name="Insert" Icon="system://Plus" Redirect="true"/>
        <sm:Action Behavior="Open" Context="Container" Name="EditDetail" Redirect="true"/>
    </sm:Container>
</sm:Screen>
