<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNNews.CustomFieldsTemplates, App_Web_customfieldstemplates.ascx.d988a5ac" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<style type="text/css">
	.centerInfos {
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;
		color: Red;
	}
</style>
<div id="EDNadmin">
	<div class="module_action_title_box">
		<ul class="module_navigation_menu">
			<li>
				<asp:LinkButton ID="lbModuleNavigationAddArticle" runat="server" ToolTip="Add article" OnClick="lbModuleNavigationAddArticle_Click"><img src="<%=ModulePath %>images/icons/paper_and_pencil.png" alt="" /></asp:LinkButton></li>
			<li>
				<asp:LinkButton ID="lbModuleNavigationArticleEditor" runat="server" ToolTip="Article editor" OnClick="lbModuleNavigationArticleEditor_Click"><img src="<%=ModulePath %>images/icons/papers_and_pencil.png" alt="" /></asp:LinkButton></li>
			<li>
				<asp:LinkButton ID="lbModuleNavigationCategoryEditor" runat="server" OnClientClick="javascript: return false;" ToolTip="Category editor"><img src="<%=ModulePath %>images/icons/categories.png" alt="" /></asp:LinkButton></li>
			<li>
				<asp:LinkButton ID="lbModuleNavigationApproveComments" runat="server" ToolTip="Approve comments" OnClick="lbModuleNavigationApproveComments_Click"><img src="<%=ModulePath %>images/icons/conversation.png" alt="" /></asp:LinkButton></li>
			<li>
				<asp:LinkButton ID="lbModuleNavigationDashboard" runat="server" ToolTip="Dashboard" OnClick="lbModuleNavigationDashboard_Click"><img src="<%=ModulePath %>images/icons/lcd.png" alt="" /></asp:LinkButton></li>
			<li class="power_off">
				<asp:LinkButton ID="lbPowerOff" runat="server" ToolTip="Close" OnClick="lbPowerOff_Click"><img src="<%=ModulePath %>images/icons/power_off.png" alt="" /></asp:LinkButton></li>
		</ul>
		<h1>
			<%=titleOfControle%></h1>
	</div>
	<div class="main_content dashboard customfields">
		<ul class="links">
			<li>
				<asp:HyperLink runat="server" ID="lblCustomFields" class="icon customfileds" resourcekey="lblCustomFields" Text="Add/Edit Custom Fields" /></li>
			<li class="activelink">
				<asp:HyperLink runat="server" ID="lblCustomFieldsTemplates" class="icon customfields_group" resourcekey="lblCustomFieldsTemplates" Text="Manage Custom Fields Groups" /></li>
			<li>
				<asp:HyperLink runat="server" ID="lblCurrencyManager" class="icon customfields_currency" resourcekey="lblCurrencyManager" Text="Currency Setup" /></li>
		</ul>
	</div>
	<div class="main_content">
		<asp:Panel ID="pnlAllSettings" class="module_settings" runat="server">
			<asp:Panel ID="pnlTemplateCreate" runat="server" Visible="true" CssClass="settings_category_container">
				<div class="category_toggle">
					<h2>
						<%=titleCreateCFGroup%>
					</h2>
				</div>
				<table class="settings_table customfileds" cellpadding="0" cellspacing="0">
					<tr>
						<td class="left">
							<dnn:Label ID="lblcfTemplateName" runat="server" Text="Name:" ControlName="tbxcfTemplateName" HelpText="Name of group." ResourceKey="lblcfTemplateName" HelpKey="lblcfTemplateName.HelpText" />
						</td>
						<td class="right">
							<asp:TextBox ID="tbxcfTemplateName" runat="server" CausesValidation="True" ValidationGroup="vgSaveFieldTemplate" Style="width: 200px" />
							<asp:RequiredFieldValidator ID="rfvcfTemplateName" runat="server" ErrorMessage="Required Field." ControlToValidate="tbxcfTemplateName" Display="Dynamic" SetFocusOnError="true" ValidationGroup="vgSaveFieldTemplate" resourcekey="rfvcfTemplateName.ErrorMessage" />
						</td>
					</tr>
					<tr>
						<td class="left">
							<dnn:Label ID="lblcfTemplateDescription" runat="server" Text="Description:" ControlName="tbxcfTemplateDescription" HelpText="Description of group." ResourceKey="lblcfTemplateDescription" HelpKey="lblcfTemplateDescription.HelpText" />
						</td>
						<td class="right">
							<asp:TextBox ID="tbxcfTemplateDescription" runat="server" Style="width: 200px" />
						</td>
					</tr>
					<%--<tr>
						<td class="left">
							<dnn:Label ID="lblcfTemplateCssUrl" runat="server" Text="Css URL:" ControlName="tbxcfTemplateCssUrl" HelpText="Css file for template" />
						</td>
						<td class="right">
							<asp:FileUpload ID="fuCss" runat="server" />
							<asp:TextBox ID="tbxcfTemplateCssUrl" runat="server" Visible="false"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="left">
							<dnn:Label ID="lblcfTemplateHTML" runat="server" Text="Template HTML URL:" ControlName="tbxcfTemplateHTML" HelpText="HTML file for template" />
						</td>
						<td class="right">
							<asp:FileUpload ID="fuHTML" runat="server" />
							<asp:TextBox ID="tbxcfTemplateHTML" runat="server" CausesValidation="True" ValidationGroup="vgSaveFieldTemplate" Visible="false"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field." ControlToValidate="tbxcfTemplateHTML" Display="Dynamic" SetFocusOnError="True"
								ValidationGroup="vgSaveFieldTemplate"></asp:RequiredFieldValidator>
						</td>
					</tr>--%>
				</table>
				<div style="width: 100%; margin-left: auto; margin-right: auto; text-align: center; padding-bottom: 20px">
					<asp:Label ID="lblSaveInfo" runat="server" EnableViewState="False" ForeColor="Red" />
					<asp:Button ID="btnSaveField" runat="server" Text="Create Group" ValidationGroup="vgSaveFieldTemplate" OnClick="btnSaveField_Click" resourcekey="btnSaveField" />
					<asp:Button ID="btnUpdateField" runat="server" Text="Update Group" ValidationGroup="vgSaveFieldTemplate" Visible="false" OnClick="btnUpdateField_Click" resourcekey="btnUpdateField" />
					<asp:Button ID="btnCancel" runat="server" Text="Close" Visible="false" OnClick="btnCancel_Click" resourcekey="btnCancel" />
				</div>
			</asp:Panel>
			<asp:Panel ID="pnlMainSelect" runat="server" Visible="true" CssClass="settings_category_container">
				<div class="category_toggle">
					<h2>
						<%=titleCFGgroups%>
					</h2>
				</div>
				<asp:Panel ID="pnlAlLTemplates" class="module_settings" runat="server" Width="100%">
					<asp:ObjectDataSource ID="odscfTemplates" runat="server" SelectMethod="GetCustomFieldsTemplates" TypeName="EasyDNNSolutions.Modules.EasyDNNNews.CustomFieldsDB">
						<SelectParameters>
							<asp:Parameter Name="PortalID" Type="Int32" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:GridView ID="gvcfTemplates" runat="server" AllowPaging="True" CssClass="grid_view_table customfields" AutoGenerateColumns="False" DataSourceID="odscfTemplates" OnRowCommand="gvcfTemplates_RowCommand" DataKeyNames="FieldsTemplateID" HorizontalAlign="Center"
						PageSize="20" Style="margin: auto" GridLines="None" Width="90%" EnableModelValidation="True">
						<AlternatingRowStyle CssClass="row second" />
						<Columns>
							<asp:TemplateField ShowHeader="False">
								<ItemTemplate>
									<asp:LinkButton ID="lbEditTemplate" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%#Eval("FieldsTemplateID") %>' Text="Edit" resourcekey="lbEditTemplate" />
								</ItemTemplate>
								<HeaderStyle Width="5%" />
							</asp:TemplateField>
							<asp:TemplateField ShowHeader="False">
								<ItemTemplate>
									<asp:LinkButton ID="lbRemoveTemplate" runat="server" CssClass="action_set tripple delete" CausesValidation="False" CommandArgument='<%#Eval("FieldsTemplateID") %>' CommandName="Remove" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" resourcekey="lbRemoveTemplate" />
								</ItemTemplate>
								<HeaderStyle Width="10%" />
							</asp:TemplateField>
							<asp:BoundField DataField="FieldsTemplateID" HeaderText="gvcfTemplatesId">
								<HeaderStyle Width="7%" />
							</asp:BoundField>
							<asp:BoundField DataField="Name" HeaderText="gvcfTemplatesName" />
							<asp:BoundField DataField="Description" HeaderText="gvcfTemplatesDescription" />
							<asp:BoundField DataField="CssURL" HeaderText="CssURL" Visible="False" />
							<asp:BoundField DataField="HTMLURL" HeaderText="HTMLURL" Visible="False" />
						</Columns>
						<HeaderStyle HorizontalAlign="Left" />
						<EditRowStyle BackColor="#E2EDF4" />
						<HeaderStyle CssClass="header_row" />
						<PagerStyle CssClass="pagination" />
						<RowStyle CssClass="row" />
					</asp:GridView>
					<table class="settings_table customfileds" cellpadding="0" cellspacing="0">
						<tr style="text-align: center;">
							<td>
								<asp:Label ID="lblAlLTemplates" runat="server" EnableViewState="False" ForeColor="Red" />
							</td>
						</tr>
					</table>
				</asp:Panel>
				<%--<table class="settings_table customfileds" cellpadding="0" cellspacing="0">
					<tr>
						<td class="left">
							<dnn:Label ID="lblImport" runat="server" Text="Import:"/>
						</td>
						<td class="right"></td>
					</tr>
					<tr>
						<td class="left">
							<dnn:Label ID="lblExport" runat="server" Text="Export:"/>
						</td>
						<td class="right"></td>
					</tr>
					<tr>
						<td class="left">
							<dnn:Label ID="lblEdit" runat="server" Text="Edit:" />
						</td>
						<td class="right"></td>
					</tr>
				</table>--%>
			</asp:Panel>
			<asp:Panel ID="pnlAddCustomFieldToTemplate" runat="server" Visible="false" CssClass="settings_category_container">
				<div class="category_toggle">
					<p class="section_number">
						1
					</p>
					<h2>
						<%=titleCFGroupAdministration%>
					</h2>
				</div>
				<table class="settings_table customfileds" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td align="center">
							<asp:Label ID="lblAddInfo" runat="server" EnableViewState="False" ForeColor="Red" />
						</td>
					</tr>
					<tr>
						<td align="center">
							<asp:Label ID="lblTemplateCustomFieldsInfo" runat="server" EnableViewState="False" ForeColor="Red" />
						</td>
					</tr>
				</table>
				<asp:Panel ID="pnlFieldsList" class="module_settings" runat="server">
					<div>
						<asp:Label ID="lblCustomFieldsList" runat="server" EnableViewState="False" Text="List of all custom fields on portal" ResourceKey="lblCustomFieldsList" CssClass="msgCFgroup" />
					</div>
					<div style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
						<asp:Label ID="lblCustomFieldsListInfo" runat="server" EnableViewState="False" Visible="false" />
					</div>
					<asp:ObjectDataSource ID="odsListOfCustomFields" runat="server" DeleteMethod="DeleteCustomField" SelectMethod="GetCustomFieldsForTemplate" TypeName="EasyDNNSolutions.Modules.EasyDNNNews.CustomFieldsDB">
						<DeleteParameters>
							<asp:Parameter Name="CustomFieldID" Type="Int32" />
						</DeleteParameters>
						<SelectParameters>
							<asp:Parameter Name="FieldsTemplateID" Type="Int32" />
							<asp:Parameter Name="PortalID" Type="Int32" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:GridView ID="gvListOfCustomFields" CssClass="grid_view_table customfields" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="odsListOfCustomFields" DataKeyNames="CustomFieldID" HorizontalAlign="Center" AutoGenerateColumns="False"
						OnRowCommand="gvListOfCustomFields_RowCommand" PageSize="30" Style="margin: auto" GridLines="None" Width="70%" EnableModelValidation="True">
						<AlternatingRowStyle CssClass="row second" />
						<Columns>
							<asp:TemplateField ShowHeader="False">
								<ItemTemplate>
									<asp:LinkButton ID="lbAddToGroup" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%#Eval("CustomFieldID") %>' Text="Add to group" resourcekey="lbAddToGroup" />
								</ItemTemplate>
								<HeaderStyle Width="20%" />
							</asp:TemplateField>
							<asp:BoundField DataField="CustomFieldID" HeaderText="gvListOfCustomFieldsId">
								<HeaderStyle Width="45px" />
							</asp:BoundField>
							<asp:BoundField DataField="Name" HeaderText="gvListOfCustomFieldsName" />
							<asp:BoundField DataField="Token" DataFormatString="[EDNcf:{0}]" HeaderText="gvListOfCustomFieldsToken" />
						</Columns>
						<HeaderStyle HorizontalAlign="Left" />
						<EditRowStyle BackColor="#E2EDF4" />
						<HeaderStyle CssClass="header_row" />
						<PagerStyle CssClass="pagination" />
						<RowStyle CssClass="row" />
					</asp:GridView>
				</asp:Panel>
				<asp:Panel ID="pnlTemplateFieldsList" class="module_settings" runat="server">
					<div>
						<asp:Label ID="lblTemplateFieldsList" runat="server" EnableViewState="False" Text="Added Fields to selected group" ResourceKey="lblTemplateFieldsList" CssClass="msgCFgroup" />
					</div>
					<asp:ObjectDataSource ID="odsTemplateCustomFields" runat="server" SelectMethod="GetCustomFieldsOfTemplate" TypeName="EasyDNNSolutions.Modules.EasyDNNNews.CustomFieldsDB">
						<SelectParameters>
							<asp:Parameter Name="FieldsTemplateID" Type="Int32" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:GridView ID="gvTemplateCustomFields" runat="server" CssClass="grid_view_table customfields" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="odsTemplateCustomFields" EnableModelValidation="True" DataKeyNames="CustomFieldID"
						HorizontalAlign="Center" OnRowCommand="gvTemplateCustomFields_RowCommand" OnDataBound="gvTemplateCustomFields_DataBound" PageSize="30" Style="margin: auto" GridLines="None" Width="100%">
						<AlternatingRowStyle CssClass="row second" />
						<Columns>
							<asp:TemplateField HeaderText="Remove">
								<ItemTemplate>
									<asp:LinkButton ID="lbRemoveFromGroup" runat="server" CausesValidation="False" CommandArgument='<%#Eval("CustomFieldID") %>' CommandName="Remove" Text="Remove from group" OnClientClick="return confirm('Are you sure you want to remove this item?');" resourcekey="lbRemoveFromGroup" />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="CustomFieldID" HeaderText="gvTemplateCustomFieldsCfId">
								<HeaderStyle Width="45px" />
							</asp:BoundField>
							<asp:BoundField DataField="ControlTypeID" HeaderText="gvTemplateCustomFieldsCfTId">
								<HeaderStyle Width="45px" />
							</asp:BoundField>
							<asp:BoundField DataField="Name" HeaderText="gvTemplateCustomFieldsName" />
							<asp:BoundField DataField="Token" DataFormatString="[EDNcf:{0}]" HeaderText="gvTemplateCustomFieldsToken" />
							<asp:TemplateField HeaderText="gvTemplateCustomFieldsIsSearchable">
								<ItemTemplate>
									<asp:Image runat="server" ImageUrl="images/accept.png" AlternateText="Yes" Visible='<%#Convert.ToBoolean(Eval("IsSearchable"))%>' />
									<asp:Image runat="server" ImageUrl="images/remove.png" AlternateText="No" Visible='<%#!Convert.ToBoolean(Eval("IsSearchable"))%>' />
								</ItemTemplate>
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:TemplateField>
							<asp:TemplateField HeaderText="gvTemplateCustomFieldsPosition">
								<ItemTemplate>
									<table style="width: 50px; height: 30px">
										<tr>
											<td runat="server" visible="false">
												<asp:TextBox ID="tbxPositionValCategory" runat="server" CssClass="boxposition" Enabled="False" Font-Size="X-Small" Height="14px" ReadOnly="True" Text='<%# Bind("Position")%>' Visible="true" Width="25px" Style="width: 25px; height: 14px;"></asp:TextBox>
											</td>
											<td>
												<asp:ImageButton ID="imgBtnUPElement" runat="server" CausesValidation="false" CommandArgument='<%#Eval("CustomFieldID") %>' CommandName="imgBtnUPElement" ImageUrl="images/icons/arrow_up_green.png" />
												<asp:ImageButton ID="imgBtnDownElement" runat="server" CausesValidation="false" CommandArgument='<%#Eval("CustomFieldID") %>' CommandName="imgBtnDownElement" ImageUrl="images/icons/arrow_down_orange.png" />
											</td>
										</tr>
									</table>
								</ItemTemplate>
								<HeaderStyle Width="60px" />
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:TemplateField>
						</Columns>
						<HeaderStyle HorizontalAlign="Left" />
						<EditRowStyle BackColor="#E2EDF4" />
						<HeaderStyle CssClass="header_row" />
						<PagerStyle CssClass="pagination" />
						<RowStyle CssClass="row" />
					</asp:GridView>
				</asp:Panel>
			</asp:Panel>
		</asp:Panel>
	</div>
</div>
