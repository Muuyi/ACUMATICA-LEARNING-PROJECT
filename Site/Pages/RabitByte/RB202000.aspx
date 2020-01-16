<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="RB202000.aspx.cs" Inherits="Page_RB202000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" PrimaryView="Customers" SuspendUnloading="False" TypeName="RB.RabitByte.CustomerMaint">
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
	<px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100; margin-top: 45px;" Width="100%" DataMember="Customers" TabIndex="4700">
		<Template>
			<px:PXLayoutRule runat="server" StartRow="True" StartColumn="True"/>
		    <px:PXSelector ID="edCustomerCD" runat="server" DataField="CustomerCD">
            </px:PXSelector>
		    <px:PXNumberEdit ID="edCustomerID" runat="server" AlreadyLocalized="False" DataField="CustomerID">
            </px:PXNumberEdit>
            <px:PXLayoutRule runat="server">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edCompanyName" runat="server" AlreadyLocalized="False" DataField="CompanyName">
            </px:PXTextEdit>
            <px:PXTextEdit ID="edContactName" runat="server" AlreadyLocalized="False" DataField="ContactName">
            </px:PXTextEdit>
            <px:PXTextEdit ID="edPhone" runat="server" AlreadyLocalized="False" DataField="Phone">
            </px:PXTextEdit>
            <px:PXTextEdit ID="edFax" runat="server" AlreadyLocalized="False" DataField="Fax">
            </px:PXTextEdit>
            <px:PXLayoutRule runat="server" ControlSize="M" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edAddress" runat="server" AlreadyLocalized="False" DataField="Address">
            </px:PXTextEdit>
            <px:PXTextEdit ID="edCity" runat="server" AlreadyLocalized="False" DataField="City">
            </px:PXTextEdit>
            <px:PXSelector ID="edCountryCD" runat="server" CommitChanges="True" DataField="CountryCD">
            </px:PXSelector>
            <px:PXTextEdit ID="edRegion" runat="server" AlreadyLocalized="False" DataField="Region">
            </px:PXTextEdit>
            <px:PXLayoutRule runat="server">
            </px:PXLayoutRule>
            <px:PXLayoutRule runat="server">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edPostalCode" runat="server" AlreadyLocalized="False" DataField="PostalCode">
            </px:PXTextEdit>
		    <px:PXLayoutRule runat="server">
            </px:PXLayoutRule>
		</Template>
		<AutoSize Container="Window" Enabled="True" MinHeight="200" />
	</px:PXFormView>
</asp:Content>
