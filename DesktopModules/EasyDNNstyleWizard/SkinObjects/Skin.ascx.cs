using System;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;

using DotNetNuke.Common;
using DotNetNuke.Entities.Users;
using DotNetNuke.UI.Skins;
using DotNetNuke.Services.Log.EventLog;

using EasyDNNSolutions.EasyDNNstyleWizard.Library.StyleWizard;
using EasyDNNSolutions.EasyDNNstyleWizard.Library.StyleWizard.Collection.Subject;

namespace EasyDNNSolutions.EasyDNNstyleWizard.StyleWizard.SkinObjects
{
	public partial class Skin : SkinObjectBase
	{

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			string clientSkinPath = PortalSettings.ActiveTab.SkinSrc,
				skinFile = clientSkinPath.Substring(clientSkinPath.LastIndexOf('/') + 1);

			skinFile = skinFile.Remove(skinFile.IndexOf('.'));

			clientSkinPath = clientSkinPath.Remove(clientSkinPath.LastIndexOf('/') + 1);
			string serverSkinPath = Page.Request.MapPath(clientSkinPath),
				themeName = clientSkinPath.Remove(clientSkinPath.LastIndexOf('/')),
				themePortal = themeName.Remove(themeName.LastIndexOf('/'));

			themeName = themeName.Substring(themeName.LastIndexOf('/') + 1);

			themePortal = themePortal.Remove(themePortal.LastIndexOf('/'));
			themePortal = themePortal.Substring(themePortal.LastIndexOf('/') + 1);

			Control cssPageControl = Page.FindControl("CSS");

			if (cssPageControl == null)
				return;

			if (Page.Header.FindControl(ID) != null)
				return;

			string skinMetaJson = String.Empty;

			try
			{
				skinMetaJson = File.ReadAllText(serverSkinPath + "StyleWizard\\meta.json", Encoding.UTF8);
			}
			catch (Exception ex)
			{
				if (ex is DirectoryNotFoundException || ex is FileNotFoundException)
					return;

				throw new Exception("The skin's StyleWizard meta file can't be read.", ex);
			}

			Meta meta;

			try
			{
				meta = JsonConvert.DeserializeObject<Meta>(skinMetaJson);
			}
			catch (Exception ex)
			{
				throw new Exception("The skin's meta file contains invalid JSON.", ex);
			}

			if (!meta.activeStyles.ContainsKey(skinFile))
				return;

			ActiveStyle activeStyle = meta.activeStyles[skinFile];

			if (activeStyle.type == "predefined" && activeStyle.id == "default")
				return;

			string id = String.Concat(
				"skinStyleCss_",
				(themePortal == "_default" ? "" : themePortal + "_"),
				themeName,
				"_style_",
				activeStyle.type, "_", activeStyle.id
			);

			var linkTag = new HtmlLink();
			linkTag.ID = Globals.CreateValidID(id);
			linkTag.Attributes["rel"] = "stylesheet";
			linkTag.Attributes["type"] = "text/css";
			linkTag.Href = String.Concat(
				clientSkinPath,
				meta.assetsClientPath,
				"css/",
				activeStyle.type,
				"/",
				activeStyle.id,
				".css"
			);

			cssPageControl.Controls.Add(linkTag);
		}

	}
}