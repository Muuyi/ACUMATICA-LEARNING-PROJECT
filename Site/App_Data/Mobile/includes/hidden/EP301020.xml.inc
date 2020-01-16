<?xml version="1.0" encoding="UTF-8"?>
<sm:Screen DisplayName="Expense Receipt" Id="EP301020" OpenAs="Form" Type="SimpleScreen" Visible="false" xmlns:sm="http://acumatica.com/mobilesitemap" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!-- header -->
    <sm:Container Name="ClaimDetails" FormActionsToExpand="1">
		<!-- actions -->
        <sm:Action Behavior="Save" Context="Record" Name="Save" After="Close"/>
        <sm:Action Behavior="Cancel" Context="Record" Name="Cancel"/>
		<sm:Action Behavior="Record" Context="Record" Name="SubmitAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="PutOnHoldAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="ApproveAction"/>
        <sm:Action Behavior="Record" Context="Record" Name="RejectAction"/>
	
		<!-- special image processing for receipts -->
		<sm:Attachments Name="ReceiptAttachments" ImageAdjustmentPreset="Receipt"/>

		<!-- header -->
		<sm:Layout Name="ReceiptIDHeader" Template="HeaderFirstAttachment">
			<sm:Field Name="ReceiptID" ForceIsDisabled="true"/>
			<sm:Field Name="Status" ForceIsDisabled="true"/>
		</sm:Layout>

        <sm:Field Name="Description" Container="ReceiptDetailsExpenseDetails"/>
        <sm:Field Name="Date"/>
		<sm:Field Name="ExpenseItem" PickerType="Searchable">
			<sm:SelectorContainer Name="ItemSelector">
                <sm:Field Name="Description"/>
                <sm:Field Name="InventoryID"/>
            </sm:SelectorContainer>
		</sm:Field>
		
		<!-- amounts -->
		<sm:Group Name="AmountsGroup" Template="ExpansionPanel" Collapsed="true">
			<sm:Layout Name="TotalLine" Template="Inline">
				<sm:Field Name="Amount" Container="ReceiptDetailsExpenseDetails"/>
				<sm:Field Name="EmployeePart" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
			<sm:Layout Name="CostLine" Template="Inline">
				<sm:Field Name="UnitCost" Container="ReceiptDetailsExpenseDetails"/>
				<sm:Field Name="Currency" PickerType="Searchable" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
			<sm:Layout Name="QtyLine" Template="Inline">
				<sm:Field Name="Quantity" Container="ReceiptDetailsExpenseDetails"/>
				<sm:Field Name="UOM" PickerType="Searchable" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
			<sm:Layout Name="RefLine" Template="Inline">
				<sm:Field Name="ClaimAmount" ForceIsDisabled="true"/>
				<sm:Field Name="RefNbr" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
			<sm:Layout Name="Taxes" Template="Inline">
				<sm:Field Name="TaxTotal" ForceIsDisabled="true"/>
				<sm:Field Name="ClaimAmount" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
		</sm:Group>

		<!-- project fields are not visible if feature disabled -->
		<sm:Field Name="ProjectContract" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsExpenseDetails"/>
		<sm:Field Name="ProjectTask" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsExpenseDetails"/>
		
		<!-- customer -->
		<sm:Field Name="Billable"  Container="ReceiptDetailsFinancialDetails"/>
		<sm:Field Name="Customer" PickerType="Searchable" Container="ReceiptDetailsFinancialDetails">
			<sm:SelectorContainer Name="CustomerSelector">
				<!-- FIXME: change the order once sorting by key fields issue is resolved -->
				<sm:Field Name="CustomerID"/>
				<sm:Field Name="CustomerName"/>
			</sm:SelectorContainer>
		</sm:Field>
		<sm:Field Name="Location" PickerType="Attached" Container="ReceiptDetailsFinancialDetails"/>

		<!-- details -->
        <sm:Group Name="ReceiptDetails" DisplayName="Details"  Collapsable="true" Collapsed="true">
			<sm:Layout Name="ClaimStatusLine" Template="Inline">
				<sm:Field Name="ExpenseClaim" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Special="AllowEdit" Weight="2" Container="ReceiptDetailsExpenseDetails">
					<sm:SelectorContainer Name="ClaimSelector">
						<sm:Field Name="Description"/>
						<sm:Field Name="ReferenceNbr"/>
					</sm:SelectorContainer>
				</sm:Field>
				<sm:Field Name="ExpenseClaimStatus" DisplayName="Status" ForceIsDisabled="true" Container="ReceiptDetailsExpenseDetails"/>
			</sm:Layout>
            <sm:Field Name="TaxZone" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsTaxInfo"/>
            <sm:Field Name="TaxCalculationMode" PickerType="Attached" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsTaxInfo"/>
            <sm:Field Name="TaxCategory" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsTaxInfo"/>
            <sm:Field Name="ExpenseAccount" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsFinancialDetails"/>
            <sm:Field Name="ExpenseSub" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsFinancialDetails"/>
            <sm:Field Name="SalesAccount" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsFinancialDetails"/>
            <sm:Field Name="SalesSub" PickerType="Searchable" SelectorDisplayFormat="KeyDescription" Container="ReceiptDetailsFinancialDetails"/>
            <sm:Field Name="NoteText" TextType="PlainMultiLine"/>
        </sm:Group>
    </sm:Container>
	
	<!-- tax details -->
	<sm:Container Name="TaxDetails" FieldsToShow="4">
	    <sm:Action Behavior="Delete" Context="Selection" Icon="system://Trash" Name="Delete"/>
		
		<sm:Field Name="TaxID" SelectorDisplayFormat="KeyDescription" PickerType="Searchable"/>
		<sm:Field Name="TaxType"/>
		<sm:Layout Name="TaxLine" Template="Inline">
			<sm:Field Name="TaxableAmount" ListDisplayFormat="CaptionValue"/>
			<sm:Field Name="TaxAmount" ListDisplayFormat="CaptionValue"/>
		</sm:Layout>
		<sm:Field Name="DeductibleTaxRate"/>
		<sm:Field Name="ExpenseAmount"/>
		<sm:Field Name="PendingVAT"/>
		<sm:Field Name="ReverseVAT"/>
		<sm:Field Name="IncludeInVATExemptTotal"/>
		<sm:Field Name="StatisticalVAT"/>
	</sm:Container>

	<!-- approval details -->
	<sm:Container Name="ApprovalDetails"  FieldsToShow="4">
		<sm:Layout Name="ApproverLine" Template="Inline">
			<sm:Field Name="ApproverName" DisplayName="Approver" ListPriority="40"/>
			<sm:Field Name="Workgroup" ListPriority="40"/>
		</sm:Layout>
		<sm:Layout Name="StatusLine" Template="Inline">
			<sm:Field Name="Status" ListPriority="20"/>
			<sm:Field Name="ApprovedByName" DisplayName="Approved By"/>
		</sm:Layout>
		<sm:Field Name="Date" ListPriority="10"/>
		<sm:Field Name="NoteText" TextType="PlainMultiLine"/>
	</sm:Container>
</sm:Screen>