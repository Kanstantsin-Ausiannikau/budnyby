using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Web.UI;

using DotNetNuke.Entities.Modules;
using DotNetNuke.UI.Skins;
using Newtonsoft.Json;

using EasyDNNSolutions.EasyDNNstyleWizard.Library.StyleWizard;
using EasyDNNSolutions.EasyDNNstyleWizard.Library.StyleWizard.Collection.Subject;
using EasyDNNSolutions.EasyDNNstyleWizard.Library;
using EasyDNNSolutions.EasyDNNstyleWizard.Library.StyleWizard.Collection.StyleGroup;
using System.Web.UI.HtmlControls;
using DotNetNuke.Common;

namespace EasyDNNSolutions.EasyDNNstyleWizard.StyleWizard.SkinObjects
{
	public partial class Container : SkinObjectBase
	{

		public string templateGroup { get; set; }

		protected override void OnLoad(EventArgs onloadEvent)
		{
			base.OnLoad(onloadEvent);

			ModuleInfo moduleInfo = ModuleControl.ModuleContext.Configuration;

			if (moduleInfo.IsDeleted)
				return;

			string metaPath = Server.MapPath(moduleInfo.ContainerPath) + "StyleWizard\\meta.json",
				metaJson;

			try
			{
				metaJson = File.ReadAllText(metaPath, Encoding.UTF8);
			}
			catch (Exception e)
			{
				if (e is DirectoryNotFoundException || e is FileNotFoundException)
					return;

				throw new Exception("The container meta file can't be read.", e);
			}

			Meta meta = new Meta();

			try
			{
				meta = JsonConvert.DeserializeObject<Meta>(metaJson);
			}
			catch (Exception e)
			{
				throw new Exception("The container meta file contains invalid JSON.", e);
			}

			string containerFilename = moduleInfo.ContainerSrc.Substring(moduleInfo.ContainerSrc.LastIndexOf('/') + 1),
				containerTheme = moduleInfo.ContainerPath.Remove(moduleInfo.ContainerPath.Length - 1),
				containerPortalId = containerTheme.Remove(containerTheme.LastIndexOf('/'));

			containerPortalId = containerPortalId.Remove(containerPortalId.LastIndexOf('/'));
			containerPortalId = containerPortalId.Substring(containerPortalId.LastIndexOf('/') + 1);

			containerTheme = containerTheme.Substring(containerTheme.LastIndexOf('/') + 1);

			containerFilename = containerFilename.Remove(containerFilename.IndexOf('.'));

			ActiveStyle activeStyle = new ActiveStyle();

			try
			{
				activeStyle = meta.activeStyles[containerFilename];
			}
			catch
			{
				activeStyle.id = "default";
				activeStyle.type = "predefined";
			}

			if (String.IsNullOrEmpty(templateGroup))
				templateGroup = "default";

			containerClass.Text = String.Concat(
				"eds_containers_", containerTheme,
				" eds_templateGroup_", templateGroup,
				" eds_template_", containerFilename,
				(activeStyle.type != "predefined" || activeStyle.id != "default" ? " eds_style_" + activeStyle.type + "_" + activeStyle.id : "")
			);

			string containersCssPath = Server.MapPath(moduleInfo.ContainerPath) + "container.css";

			if (File.Exists(containersCssPath))
				return;

			new ContainerController(containerTheme, containerPortalId, PortalSettings.HomeDirectoryMapPath, PortalSettings.HomeDirectory).rebuildCss();

			Control cssPageControl = Page.FindControl("CSS");

			if (cssPageControl == null)
				return;

			if (Page.Header.FindControl(ID) != null)
				return;

			var linkTag = new HtmlLink();
			linkTag.ID = Globals.CreateValidID(containerPortalId + "_" + containerTheme + "_containers");
			linkTag.Attributes["rel"] = "stylesheet";
			linkTag.Attributes["type"] = "text/css";
			linkTag.Href = moduleInfo.ContainerPath + "container.css";

			cssPageControl.Controls.Add(linkTag);
		}

	}
}