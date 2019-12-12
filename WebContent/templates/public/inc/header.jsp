<%@page import="util.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CategoryDAO"%>
<%@page import="model.bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en-US" prefix="og: http://ogp.me/ns#">
<head>
<meta charset="UTF-8"><script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,n,t){function r(t){if(!n[t]){var o=n[t]={exports:{}};e[t][0].call(o.exports,function(n){var o=e[t][1][n];return r(o||n)},o,o.exports)}return n[t].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<t.length;o++)r(t[o]);return r}({1:[function(e,n,t){function r(){}function o(e,n,t){return function(){return i(e,[c.now()].concat(u(arguments)),n?null:this,t),n?void 0:this}}var i=e("handle"),a=e(3),u=e(4),f=e("ee").get("tracer"),c=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,n){s[n]=o(d+n,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),n.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,n){var t={},r=this,o="function"==typeof n;return i(l+"tracer",[c.now(),e,t],r),function(){if(f.emit((o?"":"no-")+"fn-start",[c.now(),r,o],t),o)try{return n.apply(this,arguments)}catch(e){throw f.emit("fn-err",[arguments,this,e],t),e}finally{f.emit("fn-end",[c.now()],t)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,n){m[n]=o(l+n)}),newrelic.noticeError=function(e,n){"string"==typeof e&&(e=new Error(e)),i("err",[e,c.now(),!1,n])}},{}],2:[function(e,n,t){function r(e,n){if(!o)return!1;if(e!==o)return!1;if(!n)return!0;if(!i)return!1;for(var t=i.split("."),r=n.split("."),a=0;a<r.length;a++)if(r[a]!==t[a])return!1;return!0}var o=null,i=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var u=navigator.userAgent,f=u.match(a);f&&u.indexOf("Chrome")===-1&&u.indexOf("Chromium")===-1&&(o="Safari",i=f[1])}n.exports={agent:o,version:i,match:r}},{}],3:[function(e,n,t){function r(e,n){var t=[],r="",i=0;for(r in e)o.call(e,r)&&(t[i]=n(r,e[r]),i+=1);return t}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],4:[function(e,n,t){function r(e,n,t){n||(n=0),"undefined"==typeof t&&(t=e?e.length:0);for(var r=-1,o=t-n||0,i=Array(o<0?0:o);++r<o;)i[r]=e[n+r];return i}n.exports=r},{}],5:[function(e,n,t){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,n,t){function r(){}function o(e){function n(e){return e&&e instanceof r?e:e?f(e,u,i):i()}function t(t,r,o,i){if(!d.aborted||i){e&&e(t,r,o);for(var a=n(o),u=v(t),f=u.length,c=0;c<f;c++)u[c].apply(a,r);var p=s[y[t]];return p&&p.push([b,t,r,a]),a}}function l(e,n){h[e]=v(e).concat(n)}function m(e,n){var t=h[e];if(t)for(var r=0;r<t.length;r++)t[r]===n&&t.splice(r,1)}function v(e){return h[e]||[]}function g(e){return p[e]=p[e]||o(t)}function w(e,n){c(e,function(e,t){n=n||"feature",y[t]=n,n in s||(s[n]=[])})}var h={},y={},b={on:l,addEventListener:l,removeEventListener:m,emit:t,get:g,listeners:v,context:n,buffer:w,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",f=e("gos"),c=e(3),s={},p={},d=n.exports=o();d.backlog=s},{}],gos:[function(e,n,t){function r(e,n,t){if(o.call(e,n))return e[n];var r=t();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(e,n,t){function r(e,n,t,r){o.buffer([e],r),o.emit(e,n,t)}var o=e("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(e,n,t){function r(e){var n=typeof e;return!e||"object"!==n&&"function"!==n?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");n.exports=r},{}],loader:[function(e,n,t){function r(){if(!E++){var e=x.info=NREUM.info,n=l.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&n))return s.abort();c(y,function(n,t){e[n]||(e[n]=t)}),f("mark",["onload",a()+x.offset],null,"api");var t=l.createElement("script");t.src="https://"+e.agent,n.parentNode.insertBefore(t,n)}}function o(){"complete"===l.readyState&&i()}function i(){f("mark",["domContent",a()+x.offset],null,"api")}function a(){return O.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-x.offset}var u=(new Date).getTime(),f=e("handle"),c=e(3),s=e("ee"),p=e(2),d=window,l=d.document,m="addEventListener",v="attachEvent",g=d.XMLHttpRequest,w=g&&g.prototype;NREUM.o={ST:setTimeout,SI:d.setImmediate,CT:clearTimeout,XHR:g,REQ:d.Request,EV:d.Event,PR:d.Promise,MO:d.MutationObserver};var h=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1118.min.js"},b=g&&w&&w[m]&&!/CriOS/.test(navigator.userAgent),x=n.exports={offset:u,now:a,origin:h,features:{},xhrWrappable:b,userAgent:p};e(1),l[m]?(l[m]("DOMContentLoaded",i,!1),d[m]("load",r,!1)):(l[v]("onreadystatechange",o),d[v]("onload",r)),f("mark",["firstbyte",u],null,"api");var E=0,O=e(5)},{}]},{},["loader"]);</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="https://demo.themeisle.com/islemag/xmlrpc.php">

<title>Share IT</title>
<script data-cfasync="false" type="text/javascript">//<![CDATA[
	var gtm4wp_datalayer_name = "dataLayer";
	var dataLayer = dataLayer || [];//]]>	
</script>
<script type="text/javascript">
		var ajaxurl = 'https://demo.themeisle.com/islemag/wp-admin/admin-ajax.php';
</script>	
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>	
<meta property="og:locale" content="en_US" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Front Page - Islemag" />
<meta property="og:url" content="https://demo.themeisle.com/islemag/" />
<meta property="og:site_name" content="Islemag" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:title" content="Front Page - Islemag" />
<meta name="twitter:creator" content="@themeisle" />
<script type='application/ld+json'>{"@context":"https:\/\/schema.org","@type":"WebSite","@id":"#website","url":"https:\/\/demo.themeisle.com\/islemag\/","name":"Islemag","potentialAction":{"@type":"SearchAction","target":"https:\/\/demo.themeisle.com\/islemag\/?s={search_term_string}","query-input":"required name=search_term_string"}}</script>
<!-- / Yoast SEO plugin. -->

<link rel='dns-prefetch' href='//maxcdn.bootstrapcdn.com' />
<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<link rel='dns-prefetch' href='//s.w.org' />
<link rel='dns-prefetch' href='//mllj2j8xvfl0.i.optimole.com' />
<link rel="alternate" type="application/rss+xml" title="Islemag &raquo; Feed" href="https://demo.themeisle.com/islemag/feed/" />
<link rel="alternate" type="application/rss+xml" title="Islemag &raquo; Comments Feed" href="https://demo.themeisle.com/islemag/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="Islemag &raquo; Front Page Comments Feed" href="https://demo.themeisle.com/islemag/front-page/feed/" />
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/s20206.pcdn.co\/islemag\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.8"}};
			!function(a,b,c){function d(a,b){var c=String.fromCharCode;l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,a),0,0);var d=k.toDataURL();l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,b),0,0);var e=k.toDataURL();return d===e}function e(a){var b;if(!l||!l.fillText)return!1;switch(l.textBaseline="top",l.font="600 32px Arial",a){case"flag":return!(b=d([55356,56826,55356,56819],[55356,56826,8203,55356,56819]))&&(b=d([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]),!b);case"emoji":return b=d([55358,56760,9792,65039],[55358,56760,8203,9792,65039]),!b}return!1}function f(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var g,h,i,j,k=b.createElement("canvas"),l=k.getContext&&k.getContext("2d");for(j=Array("flag","emoji"),c.supports={everything:!0,everythingExceptFlag:!0},i=0;i<j.length;i++)c.supports[j[i]]=e(j[i]),c.supports.everything=c.supports.everything&&c.supports[j[i]],"flag"!==j[i]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[j[i]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(h=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",h,!1),a.addEventListener("load",h,!1)):(a.attachEvent("onload",h),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),g=c.source||{},g.concatemoji?f(g.concatemoji):g.wpemoji&&g.twemoji&&(f(g.twemoji),f(g.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='dashicons-css'  href='https://s20206.pcdn.co/islemag/wp-includes/css/dashicons.min.css?ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='menu-icons-extra-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/menu-icons/css/extra.min.css?ver=0.11.2' type='text/css' media='all' />
<style id='optm_lazyload_noscript_style-inline-css' type='text/css'>
.optimole-no-script img[data-opt-src] { display: none !important; }
</style>
<link rel='stylesheet' id='obfx-module-pub-css-menu-icons-0-css'  href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css?ver=2.7.5' type='text/css' media='all' />
<link rel='stylesheet' id='obfx-module-pub-css-menu-icons-1-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/themeisle-companion/obfx_modules/menu-icons/css/public.css?ver=2.7.5' type='text/css' media='all' />
<link rel='stylesheet' id='sb_instagram_styles-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/instagram-feed/css/sb-instagram.min.css?ver=1.9.1' type='text/css' media='all' />
<link rel='stylesheet' id='sb-font-awesome-css'  href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='post-views-counter-frontend-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/post-views-counter/css/frontend.css?ver=1.2.13' type='text/css' media='all' />
<link rel='stylesheet' id='SFSImainCss-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/ultimate-social-media-icons/css/sfsi-style.css?ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='islemag-bootstrap-css'  href='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/css/bootstrap.min.css?ver=3.3.5' type='text/css' media='all' />
<link rel='stylesheet' id='islemag-style-css'  href='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/style.css?ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='islemag-fontawesome-css'  href='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/css/font-awesome.min.css?ver=4.4.0' type='text/css' media='all' />
<link rel='stylesheet' id='islemag-fonts-css'  href='//fonts.googleapis.com/css?family=Lato%3A400%2C700%7CRaleway%3A400%2C500%2C600%2C700%7COpen+Sans%3A400%2C700%2C600&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />
<link rel='stylesheet' id='latest-posts-style-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/latest-posts/assets/css/style.css?ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='PI_stt_front-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/simple-twitter-tweets/css/stt.min.css?ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='sccss_style-css'  href='https://demo.themeisle.com/islemag/?sccss=1&#038;ver=4.9.8' type='text/css' media='all' />
<link rel='stylesheet' id='sib-front-css-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/mailin/css/mailin-front.css?ver=4.9.8' type='text/css' media='all' />
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var pf = {"spam":{"label":"I'm human!","value":"3ccd752e6e"}};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/pirate-forms/public/js/custom-spam.js?ver=4.9.8'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/duracelltomi-google-tag-manager/js/gtm4wp-form-move-tracker.js?ver=1.8.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var sibErrMsg = {"invalidMail":"Please fill out valid email address","requiredField":"Please fill out required fields","invalidDateFormat":"Please fill out valid date format","invalidSMSFormat":"Please fill out valid phone number"};
var ajax_sib_front_object = {"ajax_url":"https:\/\/demo.themeisle.com\/islemag\/wp-admin\/admin-ajax.php","ajax_nonce":"3275f5f189","flag_url":"https:\/\/demo.themeisle.com\/islemag\/wp-content\/plugins\/mailin\/img\/flags\/"};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/mailin/js/mailin-front.js?ver=1535372877'></script>
<link rel='https://api.w.org/' href='https://demo.themeisle.com/islemag/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.themeisle.com/islemag/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://s20206.pcdn.co/islemag/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 4.9.8" />
<link rel='shortlink' href='https://demo.themeisle.com/islemag/' />
<link rel="alternate" type="application/json+oembed" href="https://demo.themeisle.com/islemag/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.themeisle.com%2Fislemag%2F" />
<link rel="alternate" type="text/xml+oembed" href="https://demo.themeisle.com/islemag/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.themeisle.com%2Fislemag%2F&#038;format=xml" />
<link rel="canonical" href="http://themeisle.com/themes/islemag/" /><meta name="generator" content="Optimole 2.0.1"><link rel="preload" href="https://mllj2j8xvfl0.i.optimole.com/w:auto/h:auto/q:90/https://s20206.pcdn.co/wp-content/uploads/sites/67/2016/04/logo2_cwd4xq.png" as="image">
		<style type="text/css">
			img[data-opt-src] {
				transition: .2s filter linear, .2s opacity linear, .2s border-radius linear;
				-webkit-transition: .2s filter linear, .2s opacity linear, .2s border-radius linear;
				-moz-transition: .2s filter linear, .2s opacity linear, .2s border-radius linear;
				-o-transition: .2s filter linear, .2s opacity linear, .2s border-radius linear;
			}
			img[data-opt-src].optml_lazyload_img {
				opacity: .75;
				filter: blur(5px);
			}
		</style>
		<script type="application/javascript">
					(function(w, d){ 
						var b = d.getElementsByTagName("head")[0];
						var s = d.createElement("script");
						var v = ("IntersectionObserver" in w) ? "_no_poly" : "";
						s.async = true;  
						s.src = "https://d5jmkjjpb7yfg.cloudfront.net/v2/latest/optimole_lib" + v  + ".min.js"; 
						b.appendChild(s);
						
					}(window, document));
					
					document.addEventListener( "DOMContentLoaded", function() { document.body.className = document.body.className.replace("optimole-no-script",""); } );
		</script><meta name="specificfeeds-verification-code-ZjhIOTJuNE1LZ1Y1VFUvV2FlSEFwQVRJVzNLcHFyYzFkNzdnVjU1cmR4QktNa0d0clJEc0x3V2RlOWpQZFY0Mk5XbkVpYnBQYVpPVlMrVC9XZWdseXJTWGNkU21xT2RIUTBPUGZJYW9XekE0UXdZTEttbGg4dkx2UEw1VDkyOFd8UmE0MytHd3RWbjFMMWg4cW1aM0IzbkxJL083WTRzbXlFRmVLM3dtaDc3VT0=" content="gZq1hphPZJhe26gffztr"/>
<!-- Google Tag Manager for WordPress by DuracellTomi -->
<script data-cfasync="false" type="text/javascript">//<![CDATA[//]]>
</script>
<!-- End Google Tag Manager for WordPress by DuracellTomi --><style type="text/css" id="custom-background-css">
body.custom-background { background-image: url("https://mllj2j8xvfl0.i.optimole.com/w:auto/h:auto/q:90/https://s20206.pcdn.co/islemag/wp-content/uploads/sites/67/2016/04/kaboompics.com_Green-bokeh-1024x683.jpg"); background-position: center top; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; }
</style>
<style type="text/css">.title-border span { color: #454545 }.post .entry-title, .post h1, .post h2, .post h3, .post h4, .post h5, .post h6, .post h1 a, .post h2 a, .post h3 a, .post h4 a, .post h5 a, .post h6 a { color: #454545 }.page-header h1 { color: #454545 }.sidebar .widget li a, .islemag-content-right, .islemag-content-right a, .post .entry-content, .post .entry-content p,
		 .post .entry-cats, .post .entry-cats a, .post .entry-comments.post .entry-separator, .post .entry-footer a,
		 .post .entry-footer span, .post .entry-footer .entry-cats, .post .entry-footer .entry-cats a, .author-content { color: #454545}.islemag-top-container .entry-block .entry-overlay-meta .entry-title a { color: #ffffff }.islemag-top-container .entry-overlay-meta .entry-overlay-date { color: #ffffff }.islemag-top-container .entry-overlay-meta .entry-separator { color: #ffffff }.islemag-top-container .entry-overlay-meta > a { color: #ffffff }.home.blog .islemag-content-left .entry-title a, .blog-related-carousel .entry-title a { color: #454545 }.islemag-content-left .entry-meta, .islemag-content-left .blog-related-carousel .entry-content p,
		.islemag-content-left .blog-related-carousel .entry-cats .entry-label, .islemag-content-left .blog-related-carousel .entry-cats a,
		.islemag-content-left .blog-related-carousel > a, .islemag-content-left .blog-related-carousel .entry-footer > a { color: #454545 }.islemag-content-left .entry-meta .entry-separator { color: #454545 }.islemag-content-left .entry-meta a { color: #454545 }.islemag-content-left .islemag-template3 .col-sm-6 .entry-overlay p { color: #454545 }</style></head>

<body class="home page-template page-template-template-frontpage page-template-template-frontpage-php page page-id-701 custom-background wp-custom-logo optimole-no-script group-blog">
	<div id="wrapper" class="boxed">
	<header id="header" class="site-header" role="banner">
		<form class="navbar-form" method="post" action="<%=request.getContextPath()%>/public/search">
			<span class="screen-reader-text">Search for:</span>
			<input type="search" id="s" name="s" class="form-control" placeholder="Search in here..." title="Search for:">
			<button type="submit" title="Search"><i class="fa fa-search"></i></button>
		</form>
		<div id="navbar" class="navbar ">
				<nav id="site-navigation" class="navigation main-navigation" role="navigation">
					<div class="menu-main-menu-container">
					<ul id="primary-menu" class="nav-menu">
						<li id="menu-item-336" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item menu-item-home menu-item-336"><a href="<%=request.getContextPath()%>/trang-chu"><i class="_mi dashicons dashicons-admin-home" aria-hidden="true" style="font-size:2em;"></i><span class="visuallyhidden">Home</span></a></li>
					<%
				  	CategoryDAO categoryDAO=new CategoryDAO();
				  	ArrayList<Category> list= categoryDAO.getItems();
				  	if (list.size()>0)
				  		for (Category item:list){
				  			String urlSlug = request.getContextPath()+"/danh-muc/"+StringUtil.makeSlug(item.getName())+"-"+item.getId();
				  			if (item.getParent_id()==0){
							    ArrayList<Category> listItem= categoryDAO.getItemsbyParent_id(item.getId());
								if (listItem.size()>0){	%>
									<li id="menu-item-113" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-113" aria-haspopup="true"><a href="<%=urlSlug%>"><%=item.getName() %></a><button class="dropdown-toggle toggled-on" aria-expanded="true"></button>								
										<ul class="sub-menu toggled-on">
										<% for (Category obj:listItem) {
								  			String urlSlug2 = request.getContextPath()+"/danh-muc/"+StringUtil.makeSlug(obj.getName())+"-"+obj.getId();
										%>
											<li id="menu-item-114" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-114"><a href="<%=urlSlug2%>"><%=obj.getName() %></a></li>									
										<%} %>
										</ul>
									</li>
								<%}else{ %>
									<li id="menu-item-246" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-246"><a href="<%=urlSlug%>"><%=item.getName() %></a></li>	
								<%}
				  			}	}%>
					</ul></div>				
				</nav><!-- #site-navigation -->
			</div><!-- #navbar -->			
		</header><!-- End #header -->