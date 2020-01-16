<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormTab.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="RB204000.aspx.cs" Inherits="Page_RB204000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormTab.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" PrimaryView="Suppliers" SuspendUnloading="False" TypeName="RB.RabitByte.SupplierMaint">
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%" DataMember="Suppliers" TabIndex="1400">
		<Template>
			<px:PXLayoutRule runat="server" StartRow="True" ControlSize="M" LabelsWidth="XS"/>
		    <px:PXSelector ID="edSupplierCD" runat="server" DataField="SupplierCD">
            </px:PXSelector>
            <px:PXLayoutRule runat="server" ControlSize="M" LabelsWidth="S" StartColumn="True">
            </px:PXLayoutRule>
            <px:PXTextEdit ID="edCompanyName" runat="server" AlreadyLocalized="False" DataField="CompanyName" DefaultLocale="">
            </px:PXTextEdit>
		</Template>
	</px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXTab ID="tab" runat="server" Width="100%" Height="150px" DataSourceID="ds" DataMember="SelectedSupplier">
		<Items>
			<px:PXTabItem Text="Supplier Details">
			    <Template>
                    <px:PXLayoutRule runat="server" ControlSize="XM" LabelsWidth="S" StartRow="True">
                    </px:PXLayoutRule>
                    <px:PXTextEdit ID="edContactName" runat="server" AlreadyLocalized="False" DataField="ContactName" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXTextEdit ID="edPhone" runat="server" AlreadyLocalized="False" DataField="Phone" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXTextEdit ID="edFax" runat="server" AlreadyLocalized="False" DataField="Fax" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXTextEdit ID="edAddress" runat="server" AlreadyLocalized="False" DataField="Address" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXTextEdit ID="edCity" runat="server" AlreadyLocalized="False" DataField="City" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXSelector ID="edCountryCD" runat="server" DataField="CountryCD">
                    </px:PXSelector>
                    <px:PXTextEdit ID="edRegion" runat="server" AlreadyLocalized="False" DataField="Region" DefaultLocale="">
                    </px:PXTextEdit>
                    <px:PXTextEdit ID="edPostalCode" runat="server" AlreadyLocalized="False" DataField="PostalCode" DefaultLocale="">
                    </px:PXTextEdit>
                </Template>
			</px:PXTabItem>
			<px:PXTabItem Text="Products">
			    <Template>
                   <px:PXGrid ID="PXGrid1"                            
                       runat="server"                           
                       DataSourceID="ds"
                        SkinID="DetailsInTab"                           
                       Width="100%" TabIndex="7100"> 
                        <EmptyMsg AnonFilteredAddMessage="No records found.
Try to change filter to see records here." AnonFilteredMessage="No records found.
Try to change filter to see records here." ComboAddMessage="No records found.
Try to change filter or modify parameters above to see records here." FilteredAddMessage="No records found.
Try to change filter to see records here." FilteredMessage="No records found.
Try to change filter to see records here." NamedComboAddMessage="No records found as '{0}'.
Try to change filter or modify parameters above to see records here." NamedComboMessage="No records found as '{0}'.
Try to change filter or modify parameters above to see records here." NamedFilteredAddMessage="No records found as '{0}'.
Try to change filter to see records here." NamedFilteredMessage="No records found as '{0}'.
Try to change filter to see records here." />
                        <Levels>
                            <px:PXGridLevel DataKeyNames="SupplierID,ProductID" DataMember="SupplierProducts">

                                <Columns>
                                    <px:PXGridColumn DataField="ProductID">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="SupplierUnit" Width="80px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="ConversionFactor" TextAlign="Right" Width="100px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="SupplierPrice" TextAlign="Right" Width="100px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="LastSupplierPrice" TextAlign="Right" Width="100px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="LastPurchaseDate" Width="90px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="MinOrderQty" TextAlign="Right" Width="100px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="Product__StockUnit" Width="80px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="Product__UnitPrice" TextAlign="Right" Width="100px">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="Product__Active" TextAlign="Center" Type="CheckBox" Width="60px">
                                    </px:PXGridColumn>
                                </Columns>

                            </px:PXGridLevel>
                        </Levels>
                        <AutoSize Enabled="True" />
                    </px:PXGrid>
                </Template>
			</px:PXTabItem>
		</Items>
		<AutoSize Container="Window" Enabled="True" MinHeight="150" />
	</px:PXTab>
</asp:Content>
