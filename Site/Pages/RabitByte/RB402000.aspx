<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="RB402000.aspx.cs" Inherits="Page_RB402000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" TypeName="RB.RabitByte.SupplierInq" PrimaryView="Filter">
	    <CallbackCommands>    
            <px:PXDSCallbackCommand Name="ViewProduct" Visible="False" DependOnGrid="grid">
            </px:PXDSCallbackCommand>   
         </CallbackCommands>   
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" DataMember="Filter" TabIndex="1100">
		<Template>
			<px:PXLayoutRule runat="server" StartRow="True" ControlSize="M" LabelsWidth="S" StartColumn="True"/>
		    <px:PXSelector ID="edCountryCD" runat="server" CommitChanges="True" DataField="CountryCD">
            </px:PXSelector>
            <px:PXNumberEdit ID="edMinOrderQty" runat="server" AlreadyLocalized="False" CommitChanges="True" DataField="MinOrderQty">
            </px:PXNumberEdit>
		    <px:PXLayoutRule runat="server" ControlSize="SM" StartColumn="True" SuppressLabel="True">
            </px:PXLayoutRule>
            <px:PXCheckBox ID="edGroupBySuppler" runat="server" AlreadyLocalized="False" CommitChanges="True" DataField="GroupBySupplier" Text="Show Average Price">
            </px:PXCheckBox>
		</Template>
	</px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" Runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" Height="150px" SkinID="Inquire" TabIndex="12200">
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
			<px:PXGridLevel DataMember="SupplierProducts">
			    <RowTemplate>
                    <px:PXSelector ID="edProductID" runat="server" DataField="ProductID">
                    </px:PXSelector>
                    <px:PXNumberEdit ID="edSupplierPrice" runat="server" AlreadyLocalized="False" DataField="SupplierPrice" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXDateTimeEdit ID="edLastPurchaseDate" runat="server" AlreadyLocalized="False" DataField="LastPurchaseDate" DefaultLocale="">
                    </px:PXDateTimeEdit>
                    <px:PXNumberEdit ID="edMinOrderQty" runat="server" AlreadyLocalized="False" DataField="MinOrderQty" DefaultLocale="">
                    </px:PXNumberEdit>
                    <px:PXSelector ID="edSupplier__CountryCD" runat="server" DataField="Supplier__CountryCD">
                    </px:PXSelector>
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="ProductID" LinkCommand="ViewProduct">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="SupplierPrice" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="LastPurchaseDate" Width="90px">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="MinOrderQty" TextAlign="Right" Width="100px">
                    </px:PXGridColumn>
                   <%-- <px:PXGridColumn DataField="Supplier__CountryCD">
                    </px:PXGridColumn>--%>
                </Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="150" />
	</px:PXGrid>
</asp:Content>
