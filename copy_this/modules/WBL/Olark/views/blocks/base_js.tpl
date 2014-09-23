[{$smarty.block.parent}]

[{assign var='oConfig'            value=$oViewConf->getConfig()}]
[{assign var='sOlarkId'           value=$oConfig->getConfigParam('sWBLOlarkSiteID')}]
[{assign var='aOlarkViews'        value=$oConfig->getConfigParam('aWBLOlarkViewsForNotice')}]
[{assign var='sActiveView'        value=$oViewConf->getActiveClassName()}]
[{assign var="aContents"          value=$oxcmp_basket->getContents()}]
[{assign var="currency"           value=$oView->getActCurrency()}]
[{assign var='sOlarkChatPosition' value=$oConfig->getConfigParam('sWBLOlarkChatPosition')}]

[{if $sOlarkId}]
	<!-- begin olark code -->
	<script data-cfasync="false" type='text/javascript'>
		/*<![CDATA[*/

		window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
			f[z]=function(){
				(a.s=a.s||[]).push(arguments)};var a=f[z]._={
			},q=c.methods.length;
			while(q--){(function(n){f[z][n]=function(){
				f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
				0:+new Date};a.P=function(u){
				a.p[u]=new Date-a.p[0]};function s(){
				a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
				hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
				return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
				b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
				b.contentWindow[g].open()}catch(w){
				c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
				var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
				b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
			loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
		/* custom configuration goes here (www.olark.com/documentation)/*]]>*/

		olark.identify('[{$sOlarkId}]');

		[{if $sActiveView|in_array:$aOlarkViews}]
			olark('api.chat.sendNotificationToOperator', ('[{oxmultilang ident="WBL_OLARK_VIEWS" args=$sActiveView}]'));
		[{/if}]

		[{if $oConfig->getConfigParam('bWBLOlarkBasketStatus')}]
			[{capture name='sCurrentBasketPrice'}]
				[{oxprice price=$oxcmp_basket->getPrice() currency=$currency}]
			[{/capture}]

			[{assign var='iArticleCount' value=$aContents|@count}]

			[{if $iArticleCount}]
				[{* We need to "fake" a var for the sprintf of oxmultilang *}]
				[{assign var='sArticleCount' value=$iArticleCount}]
			[{/if}]

			olark('api.chat.updateVisitorStatus', {snippet: ['[{oxmultilang ident="WBL_OLARK_BASKETINFORMATION" args=$sArticleCount|default:'-'}]', '[{oxmultilang ident="WBL_OLARK_BASKETINFORMATIONPRICE" args=$smarty.capture.sCurrentBasketPrice}]']});
		[{/if}]


		[{if $sOlarkChatPosition}]
			olark.configure('box.corner_position', '[{$sOlarkChatPosition}]');
		[{/if}]


		[{if $oView->getIsOrderStep() && $oConfig->getConfigParam('bWBLOlarkHideInCheckout')}]
			olark('api.box.hide');
		[{/if}]


		[{if $oConfig->getConfigParam('bWBLOlarkDisplayUserInformation') && $oxcmp_user}]
			olark('api.visitor.updateEmailAddress', {emailAddress: ('[{$oxcmp_user->oxuser__oxusername->value}]')});
			olark('api.visitor.updateFullName', {fullName: ('[{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}]')});

			[{if $oxcmp_user->oxuser__oxfon->value}]
					olark('api.visitor.updatePhoneNumber', {phoneNumber: ('[{$oxcmp_user->oxuser__oxfon->value}]')});
			[{/if}]
		[{/if}]

	</script>
	<noscript>
		<a href="https://www.olark.com/site/[{$sOlarkId}]/contact" title="[{oxmultilang ident='WBL_OLARK_NS_LINK'}]" target="_blank">[{oxmultilang ident='WBL_OLARK_NS_LINK'}]</a> powered by <a href="http://www.olark.com?welcome" title="Olark live chat software">Olark live chat software</a>
	</noscript>
	<!-- end olark code -->
[{/if}]