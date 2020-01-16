<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="RB302000.aspx.cs" Inherits="Page_RB302000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" PrimaryView="Shipments" SuspendUnloading="False" TypeName="RB.RabitByte.ShipmentEntry">
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" DataMember="Shipments" TabIndex="6900">
		<Template>
			<px:PXLayoutRule runat="server" StartRow="True" ControlSize="SM" LabelsWidth="S" StartColumn="True"/>
		    <px:PXSelector ID="edShipmentNbr" runat="server" DataField="ShipmentNbr">
            </px:PXSelector>
            <px:PXTextEdit ID="edShipmentType" runat="server" AlreadyLocalized="False" DataField="ShipmentType" DefaultLocale="">
            </px:PXTextEdit>
            <px:PXDateTimeEdit ID="edDeliveryDate" runat="server" AlreadyLocalized="False" DataField="DeliveryDate" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXSelector ID="edCustomerID" runat="server" DataField="CustomerID">
            </px:PXSelector>
            <px:PXLayoutRule runat="server" ColumnSpan="3">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edDescription" runat="server" AlreadyLocalized="False" DataField="Description" DefaultLocale="">
            </px:PXTextEdit>
            <px:PXLayoutRule runat="server" ColumnWidth="S" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXDateTimeEdit ID="edShipmentDate" runat="server" AlreadyLocalized="False" DataField="ShipmentDate" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXTextEdit ID="edStatus" runat="server" AlreadyLocalized="False" DataField="Status" DefaultLocale="">
            </px:PXTextEdit>
            <px:PXDateTimeEdit ID="edDeliveryMaxDate" runat="server" AlreadyLocalized="False" DataField="DeliveryMaxDate" DefaultLocale="">
            </px:PXDateTimeEdit>
            <px:PXLayoutRule runat="server" ColumnWidth="S" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXNumberEdit ID="edTotalQty" runat="server" AlreadyLocalized="False" DataField="TotalQty" DefaultLocale="" Enabled="False">
            </px:PXNumberEdit>
            <px:PXNumberEdit ID="edShippedQty" runat="server" AlreadyLocalized="False" DataField="ShippedQty" DefaultLocale="" Enabled="False">
            </px:PXNumberEdit>
            <px:PXNumberEdit ID="edPendingQty" runat="server" AlreadyLocalized="False" DataField="PendingQty" DefaultLocale="" Enabled="False">
            </px:PXNumberEdit>
		</Template>
	</px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" Runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" Height="150px" SkinID="Details" TabIndex="6100">
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
			<px:PXGridLevel DataMember="ShipmentLines">
			    <RowTemplate>
                    <px:PXLayoutRule runat="server" ControlSize="M" GroupCaption="Item Details" LabelsWidth="S" StartColumn="True" StartRow="True">
                    </px:PXLayoutRule>
                    <px:PXSelector ID="edProductID" runat="server" DataField="ProductID">
                    </px:PXSelector>
                    <px:PXTextEdit ID="edDescription" runat="server" AlreadyLocalized="False" DataField="Description" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXNumberEdit ID="edLineQty" runat="server" AlreadyLocalized="False" DataField="LineQty" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXCheckBox ID="edCancelled" runat="server" AlreadyLocalized="False" DataField="Cancelled" Text="Cancelled">
                    </px:PXCheckBox>
                    <px:PXLayoutRule runat="server" EndGroup="True">
                    </px:PXLayoutRule>
                    <px:PXLayoutRule runat="server" ControlSize="S" GroupCaption="Delivery" LabelsWidth="S" StartColumn="True">
                    </px:PXLayoutRule>
                    <px:PXDateTimeEdit ID="edShipmentDate" runat="server" AlreadyLocalized="False" DataField="ShipmentDate" DefaultLocale="">
                    </px:PXDateTimeEdit>
                    <px:PXNumberEdit ID="edShipmentTime" runat="server" AlreadyLocalized="False" DataField="ShipmentTime" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXNumberEdit ID="edShipmentMinTime" runat="server" AlreadyLocalized="False" DataField="ShipmentMinTime" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXNumberEdit ID="edShipmentMaxTime" runat="server" AlreadyLocalized="False" DataField="ShipmentMaxTime" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXLayoutRule runat="server" EndGroup="True">
                    </px:PXLayoutRule>
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="ProductID">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="Description" Width="200px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="LineQty" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="Cancelled" TextAlign="Center" Type="CheckBox" Width="60px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="ShipmentDate" Width="90px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="ShipmentTime" TextAlign="Right" TimeMode="True">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="ShipmentMinTime" TextAlign="Right" TimeMode="True">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="ShipmentMaxTime" TextAlign="Right" TimeMode="True">
                    </px:PXGridColumn>
                </Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="150" />
	    <Mode AllowFormEdit="True" />
	</px:PXGrid>
</asp:Content>
