<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen DisplayName="Expense Receipts" Id="EP301010" Type="FilterListScreen" Visible="true" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!-- filter -->
	<sm:Container Name="Selection">
		<sm:Field Name="Employee" PickerType="Searchable"/>
	</sm:Container>
	
	<!-- list -->
	<sm:Container Name="ExpenseReceipts" FieldsToShow="4" ContainerActionsToExpand="3" ListActionsToExpand="3">
		<!-- container actions -->
		<sm:Action Behavior="Open" Context="Container" Name="EditDetail" Redirect="true"/>
		<sm:Action Behavior="Create" Context="Container" Icon="system://Plus" Name="AddNew" Redirect="true"/>
		<sm:Action Behavior="Void" Context="Container" Name="ProcessAll" Redirect="true" SyncLongOperation="true"/>
		<!-- selection actions -->
		<sm:Action Behavior="Delete" Context="Selection" Icon="system://Trash" Name="Delete"/>
		<sm:Action Behavior="Void" Context="List" Name="Process" Redirect="true" SyncLongOperation="true"/>

		<sm:Field Name="DescriptionTranDesc"/>
		<sm:Field Name="ClaimAmount"/>
		<sm:Field Name="Date"/>
		<sm:Field Name="Currency"/>
	</sm:Container>
</sm:Screen>