<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="RB301000.aspx.cs" Inherits="Page_RB301000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" TypeName="RB.RabitByte.SalesOrderEntry" PrimaryView="Orders" SuspendUnloading="False">
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" DataMember="Orders" TabIndex="1100">
		<Template>
			<px:PXLayoutRule runat="server" StartRow="True" ControlSize="S" LabelsWidth="S" StartColumn="True"/>
		    <px:PXSelector ID="edOrderNbr" runat="server" DataField="OrderNbr">
            </px:PXSelector>
            <px:PXDateTimeEdit ID="edOrderDate" runat="server" AlreadyLocalized="False" DataField="OrderDate" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXDropDown ID="edStatus" runat="server" DataField="Status">
            </px:PXDropDown>
            <px:PXCheckBox ID="edHold" runat="server" AlreadyLocalized="False" DataField="Hold" Text="Hold" CommitChanges="True">
            </px:PXCheckBox>
            <px:PXLayoutRule runat="server" ControlSize="XM" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXSelector ID="edCustomerID" runat="server" DataField="CustomerID">
            </px:PXSelector>
            <px:PXDateTimeEdit ID="edRequiredDate" runat="server" AlreadyLocalized="False" DataField="RequiredDate" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXDateTimeEdit ID="edShippedDate" runat="server" AlreadyLocalized="False" DataField="ShippedDate" Enabled="False" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXLayoutRule runat="server" ColumnSpan="2">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edDescription" runat="server" AlreadyLocalized="False" DataField="Description" DefaultLocale="">
            </px:PXTextEdit>
            <px:PXLayoutRule runat="server" ControlSize="XM" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXNumberEdit ID="edLinesTotal" runat="server" AlreadyLocalized="False" DataField="LinesTotal" Enabled="False" DefaultLocale="">
            </px:PXNumberEdit>
            <px:PXNumberEdit ID="edTaxTotal" runat="server" AlreadyLocalized="False" DataField="TaxTotal" Enabled="False" DefaultLocale="">
            </px:PXNumberEdit>
            <px:PXNumberEdit ID="edOrderTotal" runat="server" AlreadyLocalized="False" DataField="OrderTotal" Enabled="False" DefaultLocale="">
            </px:PXNumberEdit>
		</Template>
	</px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" Runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" Height="150px" SkinID="Details" TabIndex="3500">
<EmptyMsg ComboAddMessage="No records found.
Try to change filter or modify parameters above to see records here." NamedComboMessage="No records found as &#39;{0}&#39;.
Try to change filter or modify parameters above to see records here." NamedComboAddMessage="No records found as &#39;{0}&#39;.
Try to change filter or modify parameters above to see records here." FilteredMessage="No records found.
Try to change filter to see records here." FilteredAddMessage="No records found.
Try to change filter to see records here." NamedFilteredMessage="No records found as &#39;{0}&#39;.
Try to change filter to see records here." NamedFilteredAddMessage="No records found as &#39;{0}&#39;.
Try to change filter to see records here." AnonFilteredMessage="No records found.
Try to change filter to see records here." AnonFilteredAddMessage="No records found.
Try to change filter to see records here."></EmptyMsg>
		<Levels>
			<px:PXGridLevel DataMember="OrderDetails">
			    <Columns>
                    <px:PXGridColumn DataField="ProductID" CommitChanges="True">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="UnitPrice" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="OrderQty" TextAlign="Right" Width="100px" CommitChanges="True">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="StockUnit" Width="80px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="TaxAmt" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="DiscPct" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="LinePrice" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                </Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="150" />
	</px:PXGrid>
</asp:Content>
