<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:STYLES runat="server" id="NewsTwoStyle" Name="NewsTwo" StyleSheet="common/base.css" UseSkinPath="true" />
<dnn:STYLES runat="server" id="NewsTwoGreyStyle" Name="NewsTwoGrey" StyleSheet="themes/grey/grey.css" UseSkinPath="true" />

<script type="text/javascript">
//<![CDATA[
jQuery(function($){
	$('head').append('<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>');
	$('.NewsTwoMain > .header #login a')[0].onclick = function () {};
});
//]]>
</script>

<script type="text/javascript" src="//vk.com/js/api/openapi.js?105"></script>

<script type="text/javascript">
VK.Widgets.Group("vk_groups", {mode: 0, width: "200", height: "400", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 63231901);
</script>

<script type="text/javascript">
  VK.init({apiId: 4120318, onlyWidgets: true});
</script>

				<script type="text/javascript">
				VK.Widgets.Like("vk_like", {type: "button", height: 24});
				</script>


<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter23923300 = new Ya.Metrika({id:23923300,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/23923300" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->


<div class="EasyDNNSkin_NewsTwo">
<div class="NewsTwoBackgroundGradient">
<div class="NewsTwoMain">
	<div class="header">
		<div class="logo"><dnn:LOGO id="dnnLogo" runat="server" /></div>
		<div class="search-container">
			<div class="search">
				<dnn:SEARCH ID="dnnSearch" runat="server" Submit="Search" ShowSite="false" ShowWeb="false" />
			</div>
			<div class="clear"></div>
		</div>
		<div class="login-language-social-container">
			<div id="login"><dnn:LOGIN ID="LOGIN1" runat="server" LegacyMode="false" /><dnn:USER ID="USER1" runat="server" LegacyMode="false" /></div>
			<div class="social-links">
				<a href="#" class="facebook" title="Facebook"><span>Facebook</span></a>
				<a href="#" class="twitter" title="Twitter"><span>Twitter</span></a>
				<a href="#" class="google" title="Google"><span>Google</span></a>
			</div>
			<div class="language"><dnn:LANGUAGE runat="server" id="dnnLANGUAGE" showMenu="False" showLinks="True" /></div>
		</div>
		<div class="clear"></div>
		<div class="main-menu"><dnn:MENU ID="main_menu" MenuStyle="DNNStandard" runat="server" /></div>
	</div>
	<div class="content-top-wraper">
		<div runat="server" id="ContentTop"></div>
	</div>
	<div class="NewsTwoContent">
		<div class="three-column-sidebar-left" runat="server" id="SidebarLeft"></div>
		<div class="three-column-content" runat="server" id="ContentPane"></div>
		<div class="three-column-sidebar-right" runat="server" id="SidebarRight"></div>
		<div class="clear"></div>
	</div>
	<div class="content-bottom-wraper">
		<div runat="server" id="ContentBottom"></div>
	</div>
	<div class="NewsTwoBottom">
		<div class="bottom-wraper">
			<div runat="server" id="FooterBox1" class="box"></div>
			<div runat="server" id="FooterBox2" class="box"></div>
			<div runat="server" id="FooterBox3" class="box"></div>
			<div runat="server" id="FooterBox4" class="box"></div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="NewsTwoFooter">
<!--	<p class="copyright"><dnn:COPYRIGHT ID="dnnCopyright" runat="server" /></p> -->
	<p class="copyright">Copyright 2013 - 2014 by Budny.by. Копирование и цитирование авторских материалов сайта разрешено при активной гиперссылке на источник</p>
<!--	<p class="terms"><dnn:TERMS ID="dnnTerms" runat="server" />  |  <dnn:PRIVACY ID="dnnPrivacy" runat="server" /></p>-->
</div>
</div>
</div>

