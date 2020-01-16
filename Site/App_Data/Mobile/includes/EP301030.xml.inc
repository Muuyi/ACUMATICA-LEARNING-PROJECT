<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen DisplayName="Expense Claims" Id="EP301030" Type="FilterListScreen" Visible="true" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!-- filter -->
    <sm:Container Name="Selection">
        <sm:Field Name="Employee" PickerType="Searchable"/>
    </sm:Container>

	<!-- list -->
    <sm:Container Name="Claim" FieldsToShow="4" ContainerActionsToExpand="3" ListActionsToExpand="3">
		<!-- list actions -->
        <sm:Action Behavior="Open" Context="Container" Name="EditDetail" Redirect="true"/>
        <sm:Action Behavior="Create" Context="Container" Icon="system://Plus" Name="CreateNew" Redirect="true"/>
		<!-- selection actions -->
        <sm:Action Behavior="Delete" Context="Selection" Icon="system://Trash" Name="Delete" />
        <sm:Action Behavior="Void" Context="Selection" Name="Submit"/>

        <sm:Field Name="Description"/>
        <sm:Field Name="ClaimTotal"/>
        <sm:Field Name="Date"/>
        <sm:Field Name="Currency"/>
    </sm:Container>
</sm:Screen>
