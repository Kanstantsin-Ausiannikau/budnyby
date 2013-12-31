/*!
 * Part of StyleWizard
 * www.easydnnsolutions.com/modules/easydnnstylewizard/
 *
 * Copyright 2013 EasyDNNsolutions.com
 * SocialMediaBox has been developed by EasyDNNsolutions.com. It can be
 * used only as an integral part of EasyDNNsolutions.com modules.
 * All unauthorized copying or use of the code or parts of the code is
 * prohibited.
 */
(function(a,m,n,p){var k=function(c){var e=a(this),l=a("> .debugging > .jsonDebugger > .results",e);a("> .debugging > .jsonDebugger > .trigger",e).on("click",function(){var d=a(this);if(d.data("inProgress"))return!1;d.data("inProgress",!0).text("Validaton in progress...").prop("disabled",!0);a.ajax({url:c.backendUrl,data:{action:"jsonValidation"},timeout:15E3,dataType:"json",cache:!1,success:function(a){var b="";if(!0==a.success){for(var c in a.validation){var b=b+('<div class="collapsableInfoBox"><div class="header"><span>'+
f(c.charAt(0).toUpperCase()+c.slice(1))+'</span></div><div class="content">'),g;for(g in a.validation[c]){var b=b+('<div class="collapsableInfoBox"><div class="header"><span>'+f(g)+'</span></div><div class="content">'),d;for(d in a.validation[c][g]){for(var e=a.validation[c][g][d],b=b+('<div class="collapsableInfoBox closed"><div class="header"><span>'+f(d)+'</span></div><div class="content">'),h=0,k=e.length;h<k;h++)b+='<p class="error">'+f(e[h])+"</p>";b+="</div></div>"}b+="</div></div>"}b+="</div></div>"}l.html(b).css("display",
"block")}},complete:function(){d.data("inProgress",!1).text("Debug JSON").prop("disabled",!1)}});return!1});l.on("click","div.collapsableInfoBox > div.header",function(){a(this).parent().toggleClass("closed")})},f=function(c){return a("<p />").text(c).html()};a.fn.styleWizardModuleInstance=function(a){return this.each(function(){k.call(this,a)})}})(eds1_10,window,document);