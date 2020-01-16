<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen DisplayName="Expense Claim" Id="EP301000" OpenAs="Form" Type="SimpleScreen" Visible="false" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<!-- claim header -->
    <sm:Container FormActionsToExpand="1" Name="DocumentSummary">
		<!-- edit actions -->
        <sm:Action Behavior="Save" Context="Record" After="Close" Name="Save"/>
        <sm:Action Behavior="Cancel" Context="Record" Name="Cancel"/>
		<!-- claim details grid Add Receipts action -->
        <sm:Action Behavior="Void" Context="Record" Redirect="true" RedirectToContainer="AddReceipts$List" Name="ShowSubmitReceipt"/>
		<!-- workflow actions -->
        <sm:Action Behavior="Record" Context="Record" Name="SubmitAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="EditAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="ApproveAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="RejectAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="ReleaseAction"/>
		
		<!-- header -->
		<sm:Layout Name="HeaderLine" Template="HeaderSimple">
			<sm:Field Name="ReferenceNbr" ForceIsDisabled="true"/>
			<sm:Field Name="Status"/>
		</sm:Layout>
        <sm:Field Name="Description"/>
		<sm:Layout Name="DatesLine" Template="Inline">
			<sm:Field Name="Date"/>
			<sm:Field Name="ApprovalDate" ForceIsDisabled="true"/>
		</sm:Layout>
		<sm:Layout Name="ClaimedByLine" Template="Inline">
			<sm:Field Name="ClaimedBy" PickerType="Searchable" SelectorDisplayFormat="Description"/>
			<sm:Field Name="DepartmentID" ForceIsDisabled="true" SelectorDisplayFormat="Description"/>
		</sm:Layout>
		<sm:Layout Name="ClaimTotalsLine" Template="Inline">
			<sm:Field Name="ClaimTotal"/>
			<sm:Field Name="Currency" PickerType="Searchable"/>
		</sm:Layout>
		<sm:Layout Name="TaxTotalsLine" Template="Inline">
			<sm:Field Name="TaxTotal"/>
			<sm:Field Name="VATTaxableTotal"/>
			<sm:Field Name="VATExemptTotal"/>
		</sm:Layout>

		<!-- FIXME: no dialog support yet, see AC-96660, force disabled for now -->
		<sm:Field Name="Customer" PickerType="Searchable" ForceIsDisabled="true"/>
		<sm:Field Name="Location" PickerType="Attached" ForceIsDisabled="true"/>

		<!-- financial details -->
		<sm:Group Name="FinDetailsGroup" DisplayName="Details" Collapsable="true" Collapsed="true">
			<sm:Field Name="Branch" Container="FinancialDetailsLinkToAPBranch" PickerType="Searchable"/>
			<sm:Field Name="TaxZone" Container="FinancialDetailsDefaultTaxInfo" PickerType="Searchable"/>
			<sm:Field Name="NoteText" TextType="PlainMultiLine"/>
		</sm:Group>
    </sm:Container>

	<!-- add receipts dialog -->
	<sm:Container ListActionsToExpand="1" Name="AddReceipts" Type="SelectionActionList" Visible="false">
        <sm:Action Behavior="Void" Context="List" Icon="system://Check" Name="SubmitReceipt"/>

        <sm:Field Name="Description"/>
        <sm:Field Name="ClaimAmount"/>
        <sm:Field Name="Date"/>
        <sm:Field Name="Currency"/>
    </sm:Container>

	<!-- expense claim details (lines) -->
    <sm:Container Name="ExpenseClaimDetails" FieldsToShow="6" ContainerActionsToExpand="3" ListActionsToExpand="3">
        <!-- actions -->
		<sm:Action Behavior="Open" Context="Container" Redirect="true" Name="EditDetail"/>
        <sm:Action Behavior="Delete" Context="Selection" Icon="system://Trash" DisplayName="Remove" Name="Delete"/>
        <sm:Action Behavior="Save" Context="Container" After="Close" Name="Save"/>
		<!-- grid Add New Receipt action -->
		<sm:Action Behavior="Create" Context="Container" Icon="system://Plus" Redirect="true" Name="CreateNew"/>
		
		<!-- list -->
		<sm:Field Name="Description"/>
        <sm:Field Name="Amount"/>
        <sm:Field Name="Date"/>
        <sm:Field Name="Currency"/>
        <sm:Field Name="Status"/>
    </sm:Container>

	<!-- tax details -->
	<sm:Container Name="TaxDetails" FieldsToShow="4">
		<sm:Field Name="TaxID" SelectorDisplayFormat="KeyDescription" PickerType="Searchable"/>
		<!-- not mapped due to AC-97151 -->
		<!-- <sm:Field Name="TaxType"/> -->
		<sm:Layout Name="TaxLine" Template="Inline">
			<sm:Field Name="TaxableAmount" ListDisplayFormat="CaptionValue"/>
			<sm:Field Name="TaxAmount" ListDisplayFormat="CaptionValue"/>
		</sm:Layout>
		<sm:Field Name="DeductibleTaxRate"/>
		<sm:Field Name="ExpenseAmount"/>
	</sm:Container>

	
	<!-- approval details -->
	<sm:Container Name="ApprovalDetails"  FieldsToShow="4">
		<sm:Layout Template="Inline">
			<sm:Field Name="ApproverName" DisplayName="Approver" ListPriority="40"/>
			<sm:Field Name="Workgroup" ListPriority="40"/>
		</sm:Layout>
		<sm:Layout Template="Inline">
			<sm:Field Name="Status" ListPriority="20"/>
			<sm:Field Name="ApprovedByName" DisplayName="Approved By"/>
		</sm:Layout>
		<sm:Layout Template="Inline">
			<sm:Field Name="DateAssigned" ForceIsDisabled="true"/>
			<sm:Field Name="Date" DisplayName="Date Approved" ListPriority="10"/>
		</sm:Layout>
		<sm:Field Name="Map"/>
		<sm:Field Name="MapRule"/>
		<sm:Field Name="MapStep"/>	
		<sm:Field Name="NoteText" TextType="PlainMultiLine"/>
	</sm:Container>
</sm:Screen>