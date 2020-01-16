<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true"
	ValidateRequest="false" CodeFile="SM204003.aspx.cs" Inherits="Pages_SM_SM204003"
	Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormView.master" %>
<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
	<px:PXDataSource ID="ds" Width="100%" runat="server" Visible="True" PrimaryView="Notifications"
		TypeName="PX.SM.SMNotificationMaint">
		<CallbackCommands>
		</CallbackCommands>	 
		<DataTrees>
			<px:PXTreeDataMember TreeView="SiteMap" TreeKeys="NodeID" />   
			<px:PXTreeDataMember TreeView="EntityItems" TreeKeys="Key"/>
            <px:PXTreeDataMember TreeView="ScreenEmailItems" TreeKeys="Key"/>

		</DataTrees>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phF" runat="Server">
	<px:PXFormView ID="PXFormView1" runat="server" DataSourceID="ds" DataMember="Notifications"
		Width="100%" DefaultControlID="ednotificationID">
		<AutoSize Enabled="True" Container="Window" />
		<Template>
			<px:PXPanel ID="PXPanel1" runat="server" RenderStyle="Simple" Style="margin: 10px;
				padding: 10px;">
				<px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="S" ControlSize="L" />
                <px:PXSelector runat="server" ID="PXSelector1" DataField="NotificationID" FilterByAllFields="True" AutoRefresh="True" TextField="Name" NullText="<NEW>" DataSourceID="ds">
					<GridProperties>
						<Columns>
							<px:PXGridColumn DataField="NotificationID" Width="60px"  />
							<px:PXGridColumn DataField="Name" Width="120px"/>
                            <px:PXGridColumn DataField="Subject" Width="220px"/>
                            <px:PXGridColumn DataField="ScreenID" Width="60px"/>
						</Columns>
					</GridProperties>
				</px:PXSelector>

 
			    <px:PXTextEdit ID="edName" runat="server" DataField="Name" AlreadyLocalized="False" DefaultLocale=""  />

				<px:PXSelector ID="edFrom" runat="server" DataField="NFrom"
				FilterByAllFields="True" DisplayMode="Text" TextMode="Search" />
				
				<px:PXTreeSelector ID="edNTo" runat="server" DataField="NTo" 
					TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
					ShowRootNode="False" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
					AppendSelectedValue="true" AutoRefresh="true" TreeDataMember="ScreenEmailItems">
					<DataBindings>
						<px:PXTreeItemBinding DataMember="ScreenEmailItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
					</DataBindings>
				</px:PXTreeSelector>
				
				<px:PXTreeSelector ID="edCc" runat="server" DataField="NCc" 
					TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
					ShowRootNode="false" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
					AppendSelectedValue="true" AutoRefresh="true" TreeDataMember="ScreenEmailItems">
					<DataBindings>
						<px:PXTreeItemBinding DataMember="ScreenEmailItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
					</DataBindings>
				</px:PXTreeSelector>
				
				<px:PXTreeSelector ID="edNBcc" runat="server" DataField="NBcc" 
					TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
					ShowRootNode="false" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
					AppendSelectedValue="true" AutoRefresh="true" TreeDataMember="ScreenEmailItems">
					<DataBindings>
						<px:PXTreeItemBinding DataMember="ScreenEmailItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
					</DataBindings>
				</px:PXTreeSelector> 

				<px:PXLayoutRule ID="PXLayoutRule1" runat="server" ColumnSpan="2" />
				<px:PXTreeSelector ID="edsubject" runat="server" DataField="Subject" 
					TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
					ShowRootNode="false" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
					AppendSelectedValue="true" AutoRefresh="true" TreeDataMember="EntityItems">
					<DataBindings>
						<px:PXTreeItemBinding DataMember="EntityItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
					</DataBindings>
				</px:PXTreeSelector>

				<px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="S" 	ControlSize="S" />
				<px:PXTreeSelector CommitChanges="True" ID="edScreenID" runat="server" DataField="ScreenID"
				MinDropWidth="413" PopulateOnDemand="True" ShowRootNode="False" TreeDataMember="SiteMap"
				TreeDataSourceID="ds" Size="M">
				<DataBindings>
					<px:PXTreeItemBinding DataMember="SiteMap" ImageUrlField="Icon" TextField="Title" ValueField="ScreenID" />
				</DataBindings>
				</px:PXTreeSelector>
                <px:PXTextEdit ID="edScreenIdRO" runat="server" DataField="ScreenIdValue" AlreadyLocalized="False"/>
			    <px:PXLayoutRule runat="server" LabelsWidth="S" 	ControlSize="M" />
			    <px:PXSelector runat="server" ID="edLocale" DataField="LocaleName" Size="M" DisplayMode="Text" />
                
			    <px:PXTreeSelector ID="edBAccount" runat="server" DataField="BAccountID" 
			                       TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
			                       ShowRootNode="False" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
			                       AppendSelectedValue="False" AutoRefresh="true" TreeDataMember="EntityItems">
			        <DataBindings>
			            <px:PXTreeItemBinding DataMember="EntityItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
			        </DataBindings>
			    </px:PXTreeSelector>
                
			    <px:PXTreeSelector ID="edContact" runat="server" DataField="ContactID" 
			                       TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
			                       ShowRootNode="False" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
			                       AppendSelectedValue="False" AutoRefresh="true" TreeDataMember="EntityItems">
			        <DataBindings>
			            <px:PXTreeItemBinding DataMember="EntityItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
			        </DataBindings>
			    </px:PXTreeSelector>
                
			    <px:PXTreeSelector ID="edRefNoteId" runat="server" DataField="RefNoteID" 
			                       TreeDataSourceID="ds" PopulateOnDemand="True" InitialExpandLevel="0"
			                       ShowRootNode="False" MinDropWidth="468" MaxDropWidth="600" AllowEditValue="true"
			                       AppendSelectedValue="False" AutoRefresh="true" TreeDataMember="EntityItems">
			        <DataBindings>
			            <px:PXTreeItemBinding DataMember="EntityItems" TextField="Name" ValueField="Path" ImageUrlField="Icon" ToolTipField="Path" />
			        </DataBindings>
			    </px:PXTreeSelector>
			</px:PXPanel> 
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
	<px:PXTab ID="tab" runat="server" Height="300px" Style="z-index: 100" Width="100%"
		DataSourceID="ds" DataMember="CurrentNotification">
		<Activity HighlightColor="" SelectedColor="" Width="" Height=""></Activity>
		<Items>
			<px:PXTabItem Text="Message">
				<Template>
				 <px:PXRichTextEdit ID="edBody" runat="server" EncodeInstructions="true" DataField="Body" Style="border-width: 0px; border-top-width: 1px;
				        width: 100%;" AllowInsertParameter="true" AllowInsertPrevParameter="True" AllowPlaceholders="true" AllowAttached="true" AllowSearch="true" AllowMacros="true" AllowLoadTemplate="true" AllowSourceMode="true"
				        OnBeforePreview="edBody_BeforePreview" OnBeforeFieldPreview="edBody_BeforeFieldPreview" FileAttribute="embedded">
				        <AutoSize Enabled="True" MinHeight="216" />
				        <InsertDatafield DataSourceID="ds" DataMember="EntityItems" TextField="Name" ValueField="Path"	ImageField="Icon" />
				        <InsertDatafieldPrev DataSourceID="ds" DataMember="EntityItems" TextField="Name" ValueField="Path"	ImageField="Icon" />
                        <LoadTemplate TypeName="PX.SM.SMNotificationMaint" DataMember="NotificationsRO" ViewName="NotificationTemplate" ValueField="notificationID" TextField="Name" DataSourceID="ds" Size="M"/>
			        </px:PXRichTextEdit>
				</Template>
			</px:PXTabItem>
        </Items>
        <AutoSize Container="Window" Enabled="True" MinHeight="250" MinWidth="300" />
    </px:PXTab>
	
</asp:Content>

