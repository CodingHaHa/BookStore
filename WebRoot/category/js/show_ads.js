(function(){var m=this,aa=function(a,b,c){return a.call.apply(a.bind,arguments)},ba=function(a,b,c){if(!a)throw Error();if(2<arguments.length){var d=Array.prototype.slice.call(arguments,2);return function(){var c=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(c,d);return a.apply(b,c)}}return function(){return a.apply(b,arguments)}},p=function(a,b,c){p=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?aa:ba;return p.apply(null,arguments)},ca=Date.now||
function(){return+new Date},da=function(a,b){function c(){}c.prototype=b.prototype;a.Ga=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.Ea=function(a,c,f){for(var d=Array(arguments.length-2),e=2;e<arguments.length;e++)d[e-2]=arguments[e];return b.prototype[c].apply(a,d)}};var r=(new Date).getTime();var ea={'"':'\\"',"\\":"\\\\","/":"\\/","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\u000b"},fa=/\uffff/.test("\uffff")?/[\\\"\x00-\x1f\x7f-\uffff]/g:/[\\\"\x00-\x1f\x7f-\xff]/g,ga=function(){},ia=function(a,b,c){switch(typeof b){case "string":ha(b,c);break;case "number":c.push(isFinite(b)&&!isNaN(b)?String(b):"null");break;case "boolean":c.push(String(b));break;case "undefined":c.push("null");break;case "object":if(null==b){c.push("null");break}if(b instanceof Array||void 0!=
b.length&&b.splice){var d=b.length;c.push("[");for(var e="",f=0;f<d;f++)c.push(e),ia(a,b[f],c),e=",";c.push("]");break}c.push("{");d="";for(e in b)b.hasOwnProperty(e)&&(f=b[e],"function"!=typeof f&&(c.push(d),ha(e,c),c.push(":"),ia(a,f,c),d=","));c.push("}");break;case "function":break;default:throw Error("Unknown type: "+typeof b);}},ha=function(a,b){b.push('"');b.push(a.replace(fa,function(a){if(a in ea)return ea[a];var b=a.charCodeAt(0),c="\\u";16>b?c+="000":256>b?c+="00":4096>b&&(c+="0");return ea[a]=
c+b.toString(16)}));b.push('"')};var ka=function(a){this.l=ja();this.s=Math.random()<a;this.events=[];this.j={}},ja=m.performance&&m.performance.now?p(m.performance.now,m.performance):ca;ka.prototype.install=function(a){a=a||window;a.google_js_reporting_queue=a.google_js_reporting_queue||[];this.events=a.google_js_reporting_queue};
var la=function(a,b,c){var d=ja();c=c();d=ja()-a.l-(d-a.l);if(a.s){var e=a.j[b]||0,f=e+1;f>e&&(a.j[b]=f);a.events.push({label:b,type:4,Fa:f,value:d})}return c},na=function(a,b){return p(function(){for(var c=[],d=0;d<arguments.length;++d)c[d]=arguments[d];return la(this,a,function(){return b.apply(void 0,c)})},ma)};var t=String.prototype.trim?function(a){return a.trim()}:function(a){return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g,"")},va=function(a){if(!oa.test(a))return a;-1!=a.indexOf("&")&&(a=a.replace(pa,"&amp;"));-1!=a.indexOf("<")&&(a=a.replace(qa,"&lt;"));-1!=a.indexOf(">")&&(a=a.replace(ra,"&gt;"));-1!=a.indexOf('"')&&(a=a.replace(sa,"&quot;"));-1!=a.indexOf("'")&&(a=a.replace(ta,"&#39;"));-1!=a.indexOf("\x00")&&(a=a.replace(ua,"&#0;"));return a},pa=/&/g,qa=/</g,ra=/>/g,sa=/"/g,ta=/'/g,ua=/\x00/g,oa=/[\x00&<>"']/,
wa={"\x00":"\\0","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\x0B",'"':'\\"',"\\":"\\\\","<":"<"},u={"'":"\\'"},xa=function(a,b){return a<b?-1:a>b?1:0};var x=function(a){x[" "](a);return a};x[" "]=function(){};var za=function(a,b){var c=ya;Object.prototype.hasOwnProperty.call(c,a)||(c[a]=b(a))};var B=function(a){try{var b;if(b=!!a&&null!=a.location.href)a:{try{x(a.foo);b=!0;break a}catch(c){}b=!1}return b}catch(c){return!1}},Aa=function(a,b){return b.getComputedStyle?b.getComputedStyle(a,null):a.currentStyle},Ba=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b.call(void 0,a[c],c,a)},Ca=function(a){var b=a.length;if(0==b)return 0;for(var c=305419896,d=0;d<b;d++)c^=(c<<5)+(c>>2)+a.charCodeAt(d)&4294967295;return 0<c?c:4294967296+c},Da=/^([0-9.]+)px$/,Ea=function(a){return(a=
Da.exec(a))?+a[1]:null};var Fa=function(a,b){this.j=a;this.l=b},Ga=function(a,b,c){this.url=a;this.j=b;this.L=!!c;this.depth=null};var Ha=function(){var a=!1;try{var b=Object.defineProperty({},"passive",{get:function(){a=!0}});window.addEventListener("test",null,b)}catch(c){}return a}(),Ia=function(a,b){a.addEventListener?a.addEventListener("load",b,Ha?void 0:!1):a.attachEvent&&a.attachEvent("onload",b)};var Ja=function(a,b,c,d,e){this.w=c||4E3;this.s=a||"&";this.D=b||",$";this.u=void 0!==d?d:"trn";this.G=e||null;this.v=!1;this.l={};this.F=0;this.j=[]},Ka=function(a,b){var c={};c[a]=b;return[c]},C=function(a,b,c,d){a.j.push(b);a.l[b]=Ka(c,d)},Na=function(a,b,c,d){b=b+"//"+c+d;var e=La(a)-d.length-0;if(0>e)return"";a.j.sort(function(a,b){return a-b});d=null;c="";for(var f=0;f<a.j.length;f++)for(var g=a.j[f],h=a.l[g],k=0;k<h.length;k++){if(!e){d=null==d?g:d;break}var l=Ma(h[k],a.s,a.D);if(l){l=c+l;
if(e>=l.length){e-=l.length;b+=l;c=a.s;break}else a.v&&(c=e,l[c-1]==a.s&&--c,b+=l.substr(0,c),c=a.s,e=0);d=null==d?g:d}}f="";a.u&&null!=d&&(f=c+a.u+"="+(a.G||d));return b+f+""},La=function(a){if(!a.u)return a.w;var b=1,c;for(c in a.l)b=c.length>b?c.length:b;return a.w-a.u.length-b-a.s.length-1},Ma=function(a,b,c,d,e){var f=[];Ba(a,function(a,h){(a=Oa(a,b,c,d,e))&&f.push(h+"="+a)});return f.join(b)},Oa=function(a,b,c,d,e){if(null==a)return"";b=b||"&";c=c||",$";"string"==typeof c&&(c=c.split(""));if(a instanceof
Array){if(d=d||0,d<c.length){for(var f=[],g=0;g<a.length;g++)f.push(Oa(a[g],b,c,d+1,e));return f.join(c[d])}}else if("object"==typeof a)return e=e||0,2>e?encodeURIComponent(Ma(a,b,c,d,e+1)):"...";return encodeURIComponent(String(a))};var Qa=function(a,b,c,d){if(Math.random()<(d||a.j))try{var e;c instanceof Ja?e=c:(e=new Ja,Ba(c,function(a,b){var c=e,d=c.F++;a=Ka(b,a);c.j.push(d);c.l[d]=a}));var f=Na(e,a.u,a.l,a.s+b+"&");f&&Pa(f)}catch(g){}},Pa=function(a){m.google_image_requests||(m.google_image_requests=[]);var b=m.document.createElement("img");b.src=a;m.google_image_requests.push(b)};var Ra=function(a,b,c){this.u=a;this.w=b;this.s=c;this.l=null;this.v=this.j},Sa=function(a,b,c){this.s=a;this.j=b||"";this.l=c||-1},Ua=function(a,b,c,d){var e;try{e=c()}catch(h){var f=a.s;try{var g=Ta(h),f=(d||a.v).call(a,b,g,void 0,void 0)}catch(k){a.j("pAR",k)}if(!f)throw h;}finally{}return e},Va=function(a,b,c,d){return function(){for(var e=[],f=0;f<arguments.length;++f)e[f]=arguments[f];return Ua(a,b,function(){return c.apply(void 0,e)},d)}};
Ra.prototype.j=function(a,b,c,d,e){try{var f=e||this.w,g=new Ja;g.v=!0;C(g,1,"context",a);b instanceof Sa||(b=Ta(b));C(g,2,"msg",b.s.substring(0,512));b.j&&C(g,3,"file",b.j);0<b.l&&C(g,4,"line",b.l.toString());b={};if(this.l)try{this.l(b)}catch(y){}if(d)try{d(b)}catch(y){}d=[b];g.j.push(5);g.l[5]=d;var h;e=m;d=[];var k,l=null;do{b=e;B(b)?(k=b.location.href,l=b.document&&b.document.referrer||null):(k=l,l=null);d.push(new Ga(k||"",b));try{e=b.parent}catch(y){e=null}}while(e&&b!=e);k=0;for(var q=d.length-
1;k<=q;++k)d[k].depth=q-k;b=m;if(b.location&&b.location.ancestorOrigins&&b.location.ancestorOrigins.length==d.length-1)for(k=1;k<d.length;++k){var n=d[k];n.url||(n.url=b.location.ancestorOrigins[k-1]||"",n.L=!0)}for(var v=new Ga(m.location.href,m,!1),z=d.length-1,q=z;0<=q;--q){var w=d[q];if(w.url&&!w.L){v=w;break}}var w=null,A=d.length&&d[z].url;0!=v.depth&&A&&(w=d[z]);h=new Fa(v,w);h.l&&C(g,6,"top",h.l.url||"");C(g,7,"url",h.j.url||"");Qa(this.u,f,g,c)}catch(y){try{Qa(this.u,f,{context:"ecmserr",
rctx:a,msg:Wa(y),url:h.j.url},c)}catch(Zb){}}return this.s};var Ta=function(a){return new Sa(Wa(a),a.fileName,a.lineNumber)},Wa=function(a){var b=a.toString();a.name&&-1==b.indexOf(a.name)&&(b+=": "+a.name);a.message&&-1==b.indexOf(a.message)&&(b+=": "+a.message);if(a.stack){a=a.stack;var c=b;try{-1==a.indexOf(c)&&(a=c+"\n"+a);for(var d;a!=d;)d=a,a=a.replace(/((https?:\/..*\/)[^\/:]*:\d+(?:.|\n)*)\2/,"$1");b=a.replace(/\n */g,"\n")}catch(e){b=c}}return b};var Xa=Array.prototype.forEach?function(a,b,c){Array.prototype.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e="string"==typeof a?a.split(""):a,f=0;f<d;f++)f in e&&b.call(c,e[f],f,a)},Ya=function(a){return Array.prototype.concat.apply(Array.prototype,arguments)};var D;a:{var Za=m.navigator;if(Za){var $a=Za.userAgent;if($a){D=$a;break a}}D=""}var E=function(a){return-1!=D.indexOf(a)};var ab=E("Opera"),F=E("Trident")||E("MSIE"),bb=E("Edge"),G=E("Gecko")&&!(-1!=D.toLowerCase().indexOf("webkit")&&!E("Edge"))&&!(E("Trident")||E("MSIE"))&&!E("Edge"),cb=-1!=D.toLowerCase().indexOf("webkit")&&!E("Edge"),db=function(){var a=m.document;return a?a.documentMode:void 0},eb;
a:{var fb="",gb=function(){var a=D;if(G)return/rv\:([^\);]+)(\)|;)/.exec(a);if(bb)return/Edge\/([\d\.]+)/.exec(a);if(F)return/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);if(cb)return/WebKit\/(\S+)/.exec(a);if(ab)return/(?:Version)[ \/]?(\S+)/.exec(a)}();gb&&(fb=gb?gb[1]:"");if(F){var hb=db();if(null!=hb&&hb>parseFloat(fb)){eb=String(hb);break a}}eb=fb}
var ib=eb,ya={},jb=function(a){za(a,function(){for(var b=0,c=t(String(ib)).split("."),d=t(String(a)).split("."),e=Math.max(c.length,d.length),f=0;0==b&&f<e;f++){var g=c[f]||"",h=d[f]||"";do{g=/(\d*)(\D*)(.*)/.exec(g)||["","","",""];h=/(\d*)(\D*)(.*)/.exec(h)||["","","",""];if(0==g[0].length&&0==h[0].length)break;b=xa(0==g[1].length?0:parseInt(g[1],10),0==h[1].length?0:parseInt(h[1],10))||xa(0==g[2].length,0==h[2].length)||xa(g[2],h[2]);g=g[3];h=h[3]}while(0==b)}return 0<=b})},kb;var lb=m.document;
kb=lb&&F?db()||("CSS1Compat"==lb.compatMode?parseInt(ib,10):5):void 0;var mb=E("Safari")&&!((E("Chrome")||E("CriOS"))&&!E("Edge")||E("Coast")||E("Opera")||E("Edge")||E("Silk")||E("Android"))&&!(E("iPhone")&&!E("iPod")&&!E("iPad")||E("iPad")||E("iPod"));var H=null,nb=null,ob=G||cb&&!mb||ab||"function"==typeof m.btoa,pb=function(a,b){var c;if(ob&&!b)c=m.btoa(a);else{c=[];for(var d=0,e=0;e<a.length;e++){for(var f=a.charCodeAt(e);255<f;)c[d++]=f&255,f>>=8;c[d++]=f}if(!H)for(H={},nb={},a=0;65>a;a++)H[a]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".charAt(a),nb[a]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.".charAt(a);b=b?nb:H;a=[];for(d=0;d<c.length;d+=3){var g=c[d],h=(e=d+1<c.length)?c[d+1]:0,k=(f=d+2<c.length)?
c[d+2]:0,l=g>>2,g=(g&3)<<4|h>>4,h=(h&15)<<2|k>>6,k=k&63;f||(k=64,e||(h=64));a.push(b[l],b[g],b[h],b[k])}c=a.join("")}return c};var I=function(a){a=parseFloat(a);return isNaN(a)||1<a||0>a?0:a},qb=/^([\w-]+\.)*([\w-]{2,})(\:[0-9]+)?$/,rb=function(a,b){return a?(a=a.match(qb))?a[0]:b:b};var sb=I("0.0"),tb=I("0.10"),ub=I("0.05"),vb=I("0.05"),wb=I("0.02"),xb=I(""),yb=I("0.02"),zb=I("0.01");var Ab=function(){return"r20161130"},J=/^true$/.test("false")?!0:!1,Bb=/^true$/.test("true")?!0:!1,Cb=/^true$/.test("false")?!0:!1,Db=Cb||!Bb;var Eb;if(!(Eb=!G&&!F)){var Fb;if(Fb=F)Fb=9<=Number(kb);Eb=Fb}Eb||G&&jb("1.9.1");F&&jb("9");var Gb=document,K=window,Hb=null,L=Gb.getElementsByTagName("script");L&&L.length&&(Hb=L[L.length-1]);var Ib=Hb;var Jb=Object.prototype.hasOwnProperty,Kb=function(a,b){for(var c in a)Jb.call(a,c)&&b.call(void 0,a[c],c,a)},M=function(a){return!(!a||!a.call)&&"function"===typeof a},Lb=function(a,b){for(var c=1,d=arguments.length;c<d;++c)a.push(arguments[c])},N=function(a,b){if(a.indexOf)return a=a.indexOf(b),0<a||0===a;for(var c=0;c<a.length;c++)if(a[c]===b)return!0;return!1},Mb=function(a){"google_onload_fired"in a||(a.google_onload_fired=!1,Ia(a,function(){a.google_onload_fired=!0}))},Nb=function(a){a=a.google_unique_id;
return"number"===typeof a?a:0},Ob=!!window.google_async_iframe_id;var O;var ma=new ka(1);O=new Ra(new function(){this.u="http:"===K.location.protocol?"http:":"https:";this.l="pagead2.googlesyndication.com";this.s="/pagead/gen_204?id=";this.j=.01},"jserror",!0);ma.install();var Rb=function(a,b){Pb(a,b,Qb)()},Pb=function(a,b,c){a=a.toString();return Va(O,a,na(a,b),c)},Qb=O.j,Sb=function(a,b){return Pb(a.toString(),b)};var P="google_ad_block google_ad_channel google_ad_client google_ad_format google_ad_height google_ad_host google_ad_host_channel google_ad_host_tier_id google_ad_modifications google_ad_output google_ad_region google_ad_section google_ad_slot google_ad_type google_ad_unit_key google_ad_dom_fingerprint google_ad_width google_adtest google_allow_expandable_ads google_alternate_ad_url google_alternate_color google_ama google_analytics_domain_name google_analytics_uacct google_analytics_url_parameters google_auto_format google_available_width google_captcha_token google_city google_color_bg google_color_border google_color_line google_color_link google_color_text google_color_url google_container_id google_content_recommendation_ui_type google_content_recommendation_columns_num google_content_recommendation_rows_num google_contents google_core_dbp google_country google_cpm google_ctr_threshold google_cust_age google_cust_ch google_cust_criteria google_cust_gender google_cust_id google_cust_interests google_cust_job google_cust_l google_cust_lh google_cust_u_url google_disable_video_autoplay google_delay_requests_count google_delay_requests_delay google_ed google_eids google_enable_content_recommendations google_enable_ose google_encoding google_floating_ad_position google_font_face google_font_size google_frame_id google_gl google_hints google_is_split_slot google_image_size google_kw google_kw_type google_lact google_language google_loeid google_max_num_ads google_max_radlink_len google_mtl google_native_settings_key google_nofo google_num_radlinks google_num_radlinks_per_unit google_only_ads_with_video google_only_pyv_ads google_only_userchoice_ads google_override_format google_page_url google_pgb_reactive google_previous_watch google_previous_searches google_pucrd google_referrer_url google_region google_responsive_formats google_responsive_auto_format google_reuse_colors google_rl_dest_url google_rl_filtering google_rl_mode google_rt google_safe google_safe_for_responsive_override google_scs google_source_type google_sui google_skip google_tag_for_child_directed_treatment google_tag_info google_tag_origin google_targeting google_tdsma google_tfs google_tl google_ui_features google_video_doc_id google_video_product_type google_video_url_to_fetch google_webgl_support google_with_pyv_ads google_yt_pt google_yt_up".split(" "),
Tb={google_ad_modifications:!0,google_analytics_domain_name:!0,google_analytics_uacct:!0},Ub=function(a){return(a=a.innerText||a.innerHTML)&&(a=a.replace(/^\s+/,"").split(/\r?\n/,1)[0].match(/^\x3c!--+(.*?)(?:--+>)?\s*$/))&&/google_ad_client/.test(a[1])?a[1]:null},Vb=function(a){if(a=a.innerText||a.innerHTML)if(a=a.replace(/^\s+|\s+$/g,"").replace(/\s*(\r?\n)+\s*/g,";"),(a=a.match(/^\x3c!--+(.*?)(?:--+>)?$/)||a.match(/^\/*\s*<!\[CDATA\[(.*?)(?:\/*\s*\]\]>)?$/i))&&/google_ad_client/.test(a[1]))return a[1];
return null},Yb=function(a){var b;try{a:{var c=a.document.getElementsByTagName("script"),d=a.navigator&&a.navigator.userAgent||"",e;if(!(e=/appbankapppuzdradb|daumapps|fban|fbios|fbav|fb_iab|gsa\/|messengerforios|naver|niftyappmobile|nonavigation|pinterest|twitter|ucbrowser|yjnewsapp|youtube/i.test(d))){var f;if(f=/i(phone|pad|pod)/i.test(d)){var g;if(g=/applewebkit/i.test(d)&&!/version|safari/i.test(d)){var h;try{h=!(!K.navigator.j&&!(J&&K.google_top_window||K.top).navigator.j)}catch(v){h=!1}g=!h}f=
g}e=f}for(var d=e?Ub:Vb,k=c.length-1;0<=k;k--){var l=c[k];if(!l.google_parsed_script){l.google_parsed_script=!0;var q=d(l);if(q){b=q;break a}}}b=null}}catch(v){return!1}if(!b)return!1;try{for(var c=/(google_\w+) *= *(['"]?[\w.-]+['"]?) *(?:;|$)/gm,k={},n;n=c.exec(b);)k[n[1]]=Wb(n[2]);Xb(k,a)}catch(v){return!1}return!!a.google_ad_client},$b=function(a){a.google_page_url&&(a.google_page_url=String(a.google_page_url));var b=[];Kb(a,function(a,d){if(null!=a){var c;try{var f=[];ia(new ga,a,f);c=f.join("")}catch(g){}c&&
(c=c.replace(/\//g,"\\$&"),Lb(b,d,"=",c,";"))}});return b.join("")},ac=function(a){for(var b=0,c=P.length;b<c;b++){var d=P[b];Tb[d]||(a[d]=null)}},Wb=function(a){switch(a){case "true":return!0;case "false":return!1;case "null":return null;case "undefined":break;default:try{var b=a.match(/^(?:'(.*)'|"(.*)")$/);if(b)return b[1]||b[2]||"";if(/^[-+]?\d*(\.\d+)?$/.test(a)){var c=parseFloat(a);return c===c?c:void 0}}catch(d){}}},Xb=function(a,b){for(var c=0;c<P.length;c++){var d=P[c];null==b[d]&&null!=
a[d]&&(b[d]=a[d])}};var bc=function(a){return(a=a.google_ad_modifications)?a.eids||[]:[]},Q=function(a){return(a=a.google_ad_modifications)?a.loeids||[]:[]},cc=function(a,b,c){if(!a)return null;for(var d=0;d<a.length;++d)if((a[d].ad_slot||b)==b&&(a[d].ad_tag_origin||c)==c)return a[d];return null};var dc={client:"google_ad_client",format:"google_ad_format",slotname:"google_ad_slot",output:"google_ad_output",ad_type:"google_ad_type",pse:"google_pstate_expt"};O.s=!J;var ec=!1;var fc=null,gc=function(){if(!fc){for(var a=window,b=a,c=0;a&&a!=a.parent;)if(a=a.parent,c++,B(a))b=a;else break;fc=b}return fc};var R={m:"388900710",B:"388900711",A:"388900712",C:"388900713"},hc={m:"10583695",o:"10583696"},ic={m:"10573695",o:"10573696"},jc={m:"4089030",o:"4089031"},kc={m:"4089035",o:"4089036"},S={aa:{},Ca:{m:"453848102",o:"453848103"},Ba:{m:"137237720",o:"137237721"},la:{m:"24819308",o:"24819309",Y:"24819320",ca:"24819321"},ka:{m:"24819330",o:"24819331"},ha:{m:"86724438",o:"86724439"},R:{m:"388900700",B:"388900701",A:"388900702",C:"388900703"},ba:{m:"26835105",o:"26835106"},T:{m:"20040000",o:"20040001"},Z:{m:"20040016",
o:"20040017"},$:{W:"314159230",ja:"314159231"},ia:{qa:"27285692",sa:"27285712",ra:"27285713"},na:{m:"27415010",o:"27415011"},fa:{m:"90091300",o:"90091301",ea:"90091302",da:"90091303"},I:{m:"62710000",o:"62710001"},oa:{m:"20040060",ma:"20040061",ga:"20040062"},pa:{za:389613E3,Aa:389613001,xa:389613002,ya:389613003,va:389613004,wa:389613005,ta:389613006,ua:389613007},X:{m:"20040063",o:"20040064"},J:{m:"62710010",VIEWPORT:"62710011",H:"62710012"},Da:{m:"20040065",o:"20040066"}},ec=!1;var T=function(a,b){b&&a.push(b)},U=function(a,b,c){for(var d=0;d<c.length;d++)if(a.location&&a.location.hash=="#google_plle_"+c[d])return c[d];var e;a:{try{var f=window.top.location.hash;if(f){var g=f.match(/\bdeid=([\d,]+)/);e=g&&g[1]||"";break a}}catch(k){}e=""}if(a=(a=e.match(new RegExp("\\b("+c.join("|")+")\\b")))&&a[0]||null)c=a;else if(ec)c=null;else a:{if(!(1E-4>Math.random())&&(a=Math.random(),a<b)){b=window;try{var h=new Uint32Array(1);b.crypto.getRandomValues(h);a=h[0]/65536/65536}catch(k){a=
Math.random()}c=c[Math.floor(a*c.length)];break a}c=null}return c};var lc=function(a,b,c){Rb("files::getSrc",function(){if("https:"==K.location.protocol&&"http"==c)throw c="https",Error("Requested url "+a+b);});return[c,"://",a,b].join("")},mc=function(a,b,c){c||(c=Db?"https":"http");return lc(a,b,c)};var V=function(a){a=a.document;return("CSS1Compat"==a.compatMode?a.documentElement:a.body)||{}};var nc=function(a){this.name="TagError";this.message=a?"adsbygoogle.push() error: "+a:"";Error.captureStackTrace?Error.captureStackTrace(this,nc):this.stack=Error().stack||""};da(nc,Error);var oc=function(a,b){this.l=a;this.j=b};oc.prototype.minWidth=function(){return this.l};oc.prototype.height=function(){return this.j};var W=function(a,b,c){oc.call(this,a,b);this.U=c};da(W,oc);var pc=function(a){return function(b){return!!(b.U&a)}},X=[new W(970,90,2),new W(728,90,2),new W(468,60,2),new W(336,280,1),new W(320,100,2),new W(320,50,2),new W(300,600,4),new W(300,250,1),new W(250,250,1),new W(234,60,2),new W(200,200,1),new W(180,150,1),new W(160,600,4),new W(125,125,1),new W(120,600,4),new W(120,240,4)],qc=[X[6],X[12],X[3],X[0],X[7],X[14],X[1],X[8],X[10],X[4],X[15],X[2],X[11],X[5],X[13],X[9]];var rc=function(a,b){do{var c=Aa(a,b);if(c&&"fixed"==c.position)return!1}while(a=a.parentElement);return!0};var sc=function(a,b,c){if(a.style){var d=Ea(a.style[c]);if(d)return d}if(a=Aa(a,b))if(d=Ea(a[c]))return d;return null},tc=function(a){return function(b){return b.minWidth()<=a}},vc=function(a,b,c){var d=a&&uc(c,b);return function(a){return!(d&&250<=a.height())}},uc=function(a,b){var c;try{var d=b.document.documentElement.getBoundingClientRect(),e=a.getBoundingClientRect();c={x:e.left-d.left,y:e.top-d.top}}catch(f){c=null}return(c?c.y:0)<V(b).clientHeight-100},wc=function(a,b){var c=Infinity;do{var d=
sc(b,a,"height");d&&(c=Math.min(c,d));(d=sc(b,a,"maxHeight"))&&(c=Math.min(c,d))}while((b=b.parentElement)&&"HTML"!=b.tagName);return c};var xc=function(a){return function(b){for(var c=a.length-1;0<=c;--c)if(!a[c](b))return!1;return!0}},yc=function(a,b,c){for(var d=a.length,e=null,f=0;f<d;++f){var g=a[f];if(b(g)){if(!c||c(g))return g;null===e&&(e=g)}}return e};var zc=function(a){this.j=a};var Bc=function(a,b,c){var d,e=.25>=a/Math.min(1200,V(b).clientWidth)?4:3;d=d||{};d.google_responsive_formats=e;d=!(E("iPad")||E("Android")&&!E("Mobile")||E("Silk"))&&(E("iPod")||E("iPhone")||E("Android")||E("IEMobile"))&&!uc(c,b)&&(d.google_safe_for_responsive_override=rc(c,b));var f=(d?qc:X).slice(0);(300>a||450<a?0:N(bc(b),R.B)||N(bc(b),R.A))&&f.unshift(new W(a,Math.floor(.8334*a+20),1));var g=488>V(b).clientWidth,e=[tc(a),Ac(g),vc(g,b,c),pc(e)],g=[];if(d){var h=wc(b,c);g.push(function(a){return a.height()<=
h})}b=yc(f,xc(e),xc(g));if(!b)throw new nc("No slot size for availableWidth="+a);return new zc(b)},Ac=function(a){return function(b){return!(320==b.minWidth()&&(a&&50==b.height()||!a&&100==b.height()))}};var Cc=function(a){this.j=a;a.google_iframe_oncopy||(a.google_iframe_oncopy={handlers:{},upd:p(this.u,this)});this.s=a.google_iframe_oncopy},Dc=function(a,b){var c=new RegExp("\\b"+a+"=(\\d+)"),d=c.exec(b);d&&(b=b.replace(c,a+"="+(+d[1]+1||1)));return b};Cc.prototype.set=function(a,b){this.s.handlers[a]=b;this.j.addEventListener&&this.j.addEventListener("load",p(this.l,this,a),!1)};
Cc.prototype.l=function(a){a=this.j.document.getElementById(a);try{var b=a.contentWindow.document;if(a.onload&&b&&(!b.body||!b.body.firstChild))a.onload()}catch(c){}};Cc.prototype.u=function(a,b){var c=Dc("rx",a);a:{if(a&&(a=a.match("dt=([^&]+)"))&&2==a.length){a=a[1];break a}a=""}a=(new Date).getTime()-a;c=c.replace(/&dtd=(\d+|-?M)/,"&dtd="+(1E5<=a?"M":0<=a?a:"-M"));this.set(b,c);return c};var Ec=va("var i=this.id,s=window.google_iframe_oncopy,H=s&&s.handlers,h=H&&H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&&d&&(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}");var Fc=function(a){if(!a)return"";(a=a.toLowerCase())&&"ca-"!=a.substring(0,3)&&(a="ca-"+a);return a};G||cb||F&&jb(11);var Gc=/MSIE [2-7]|PlayStation|Gecko\/20090226|Android 2\.|Opera/i;var Hc=null;var Ic={"120x90":!0,"160x90":!0,"180x90":!0,"200x90":!0,"468x15":!0,"728x15":!0};var Y=function(a){this.u=[];this.l=a||window;this.j=0;this.s=null;this.F=0},Z,Jc=function(a){try{return a.sz()}catch(b){return!1}},Kc=function(a){return!!a&&("object"===typeof a||"function"===typeof a)&&Jc(a)&&M(a.nq)&&M(a.nqa)&&M(a.al)&&M(a.rl)},Lc=function(){if(Z&&Jc(Z))return Z;var a=gc(),b=a.google_jobrunner;return Kc(b)?Z=b:a.google_jobrunner=Z=new Y(a)},Mc=function(a,b){Lc().nq(a,b)},Nc=function(a,b){Lc().nqa(a,b)};
Y.prototype.G=function(a,b){0!=this.j||0!=this.u.length||b&&b!=window?this.v(a,b):(this.j=2,this.D(new Oc(a,window)))};Y.prototype.v=function(a,b){this.u.push(new Oc(a,b||this.l));Pc(this)};Y.prototype.N=function(a){this.j=1;if(a){var b=Sb("sjr::timeout",p(this.w,this,!0));this.s=this.l.setTimeout(b,a)}};Y.prototype.w=function(a){a&&++this.F;1==this.j&&(null!=this.s&&(this.l.clearTimeout(this.s),this.s=null),this.j=0);Pc(this)};Y.prototype.O=function(){return!(!window||!Array)};Y.prototype.M=function(){return this.F};
var Pc=function(a){var b=Sb("sjr::tryrun",p(a.P,a));a.l.setTimeout(b,0)};Y.prototype.P=function(){if(0==this.j&&this.u.length){var a=this.u.shift();this.j=2;var b=Sb("sjr::run",p(this.D,this,a));a.j.setTimeout(b,0);Pc(this)}};Y.prototype.D=function(a){this.j=0;a.l()};Y.prototype.nq=Y.prototype.G;Y.prototype.nqa=Y.prototype.v;Y.prototype.al=Y.prototype.N;Y.prototype.rl=Y.prototype.w;Y.prototype.sz=Y.prototype.O;Y.prototype.tc=Y.prototype.M;var Oc=function(a,b){this.l=a;this.j=b};var Qc=Ob?1==Nb(K):!Nb(K),Rc=function(){var a=Cb?"https":"http",b=x("script"),c;a:{if(J)try{var d=K.google_cafe_host||K.top.google_cafe_host;if(d){c=d;break a}}catch(e){}c=rb("","pagead2.googlesyndication.com")}return["<",b,' src="',mc(c,["/pagead/js/",Ab(),"/r20161129/show_ads_impl.js"].join(""),a),'"></',b,">"].join("")},Sc=function(a,b,
c,d){return function(){var e=!1;d&&Lc().al(3E4);try{var f=a.document.getElementById(b).contentWindow;if(B(f)){var g=a.document.getElementById(b).contentWindow,h=g.document;h.body&&h.body.firstChild||(/Firefox/.test(navigator.userAgent)?h.open("text/html","replace"):h.open(),g.google_async_iframe_close=!0,h.write(c))}else{for(var k=a.document.getElementById(b).contentWindow,f=c,f=String(f),g=['"'],h=0;h<f.length;h++){var l=f.charAt(h),q=l.charCodeAt(0),n=h+1,v;if(!(v=wa[l])){var z;if(31<q&&127>q)z=
l;else{var w=void 0,A=l;if(A in u)z=u[A];else if(A in wa)z=u[A]=wa[A];else{var y=A.charCodeAt(0);if(31<y&&127>y)w=A;else{if(256>y){if(w="\\x",16>y||256<y)w+="0"}else w="\\u",4096>y&&(w+="0");w+=y.toString(16).toUpperCase()}z=u[A]=w}}v=z}g[n]=v}g.push('"');k.location.replace("javascript:"+g.join(""))}e=!0}catch(Zb){k=gc().google_jobrunner,Kc(k)&&k.rl()}e&&(e=Dc("google_async_rrc",c),(new Cc(a)).set(b,Sc(a,b,e,!1)))}},Tc=function(a){var b=["<iframe"];Kb(a,function(a,d){null!=a&&b.push(" "+d+'="'+va(a)+
'"')});b.push("></iframe>");return b.join("")},Uc=function(a){if(!Hc)a:{for(var b=[m.top],c=[],d=0,e;e=b[d++];){c.push(e);try{if(e.frames)for(var f=e.frames.length,g=0;g<f&&1024>b.length;++g)b.push(e.frames[g])}catch(k){}}for(b=0;b<c.length;b++)try{var h=c[b].frames.google_esf;if(h){Hc=h;break a}}catch(k){}Hc=null}if(!Hc){c={style:"display:none"};if(/[^a-z0-9-]/.test(a))return"";c["data-ad-client"]=Fc(a);c.id="google_esf";c.name="google_esf";a=mc(rb("","googleads.g.doubleclick.net"),
["/pagead/html/",Ab(),"/r20161129/zrt_lookup.html"].join(""));c.src=a;return Tc(c)}return""},Vc=function(a,b){var c=b.google_ad_output,d=b.google_ad_format;d||"html"!=c&&null!=c||(d=b.google_ad_width+"x"+b.google_ad_height);c=!b.google_ad_slot||b.google_override_format||!Ic[b.google_ad_width+"x"+b.google_ad_height]&&"aa"==b.google_loader_used;d&&c?d=d.toLowerCase():d="";b.google_ad_format=d;if("number"!=typeof b.google_reactive_sra_index||
!b.google_ad_unit_key){for(var d=[b.google_ad_slot,b.google_ad_format,b.google_ad_type,b.google_ad_width,b.google_ad_height],c=[],e=0,f=Ib.parentElement;f&&25>e;f=f.parentNode,++e)c.push(9!==f.nodeType&&f.id||"");(c=c.join())&&d.push(c);b.google_ad_unit_key=Ca(d.join(":")).toString();d=Ib;c=[];for(e=0;d&&25>e;++e){var f=(f=9!==d.nodeType&&d.id)?"/"+f:"",g;a:{if(d&&d.nodeName&&d.parentElement){g=d.nodeName.toString().toLowerCase();for(var h=d.parentElement.childNodes,k=0,l=0;l<h.length;++l){var q=
h[l];if(q.nodeName&&q.nodeName.toString().toLowerCase()===g){if(d===q){g="."+k;break a}++k}}}g=""}c.push((d.nodeName&&d.nodeName.toString().toLowerCase())+f+g);d=d.parentElement}d=c.join()+":";c=[];if(a)try{for(var n=a.parent,e=0;n&&n!==a&&25>e;++e){for(var v=n.frames,f=0;f<v.length;++f)if(a===v[f]){c.push(f);break}a=n;n=a.parent}}catch(z){}b.google_ad_dom_fingerprint=Ca(d+c.join()).toString()}};(function(a){O.l=function(b){Xa(a,function(a){a(b)})}})([function(a){a.shv=Ab()},function(a){Ba(dc,function(b,c){try{null!=m[b]&&(a[c]=m[b])}catch(d){}})},function(a){try{var b=m.google_ad_modifications;if(null!=b){var c=Ya(b.eids,b.loeids);null!=c&&0<c.length&&(a.eid=c.join(","))}}catch(d){}}]);
Rb("sa::main",function(){var a=window,b=a.google_ad_modifications=a.google_ad_modifications||{};if(!b.plle){b.plle=!0;var c=b.eids=b.eids||[],b=b.loeids=b.loeids||[],d,e,f;d=hc;T(c,U(a,ub,[d.m,d.o]));d=ic;T(c,U(a,vb,[d.m,d.o]));d=jc;T(c,U(a,sb,[d.m,d.o]));d=kc;T(c,U(a,tb,[d.m,d.o]));d=S.R;e=U(a,wb,[d.m,d.B,d.A,d.C]);T(b,e);e==d.m?f=R.m:e==d.B?f=R.B:e==d.A?f=R.A:e==d.C?f=R.C:f="";T(c,f);Gb.body||(d=S.T,T(b,U(a,xb,[d.m,d.o])));d=S.I;e=U(a,yb,[d.m,d.o]);T(b,e);t("")&&
T(b,"");d=S.J;e=U(a,zb,[d.m,d.VIEWPORT,d.H]);T(b,e)}b=a.google_ad_slot;c=a.google_ad_modifications;!c||cc(c.ad_whitelist,b,void 0)?c=null:(f=c.space_collapsing||"none",c=(b=cc(c.ad_blacklist,b))?{K:!0,V:b.space_collapsing||f}:c.remove_ads_by_default?{K:!0,V:f}:null);if(c&&c.K)ac(a);else if(Mb(a),N(Q(K),S.I.o)&&(c={4205305285:!0,1042763955:!0,3202442099:!0,1772659378:!0,3117125756:!0,3960366076:!0},"js"==K.google_ad_output&&K.google_ad_client&&c[Ca(K.google_ad_client)]&&
(K.google_enable_async=!0)),!1===window.google_enable_async||Gc.test(navigator.userAgent)||window.google_container_id||window.google_ad_output&&"html"!=window.google_ad_output&&("js"!=window.google_ad_output||!0!==window.google_enable_async))a.google_loader_used="sb",a.google_start_time=r,Vc(a,a),document.write(Uc(a.google_ad_client)+Rc());else{Qc&&(f=a.google_ad_client,c=navigator,a&&f&&c&&(c=a.document,f=Fc(f),/[^a-z0-9-]/.test(f)||((b=t("r20160913"))&&(b+="/"),b=mc("pagead2.googlesyndication.com",
"/pub-config/"+b+f+".js"),f=c.createElement("script"),f.src=b,(c=c.getElementsByTagName("script")[0])&&c.parentNode&&c.parentNode.insertBefore(f,c))));a.google_unique_id?++a.google_unique_id:a.google_unique_id=1;c={};null==a.google_ad_client&&Yb(a)&&(c.google_loader_features_used=2048);Xb(a,c);c.google_loader_used="sa";ac(a);f=S.J;if(N(Q(a),f.VIEWPORT)||N(Q(a),f.H)&&a.document&&a.document.body){b=a.document;if(b.currentScript)b=b.currentScript.parentElement;else if(b=b.getElementsByTagName("script"),
b=b[b.length-1].parentElement,!b)throw new nc("show_ads.js script not included in document.body");d=c.google_ad_width;a:{e=b;var g;g=J&&a.google_top_window||a.top;if(g=B(g)?g:null){g=V(g).clientWidth;var h=a.document.body.currentStyle?a.document.body.currentStyle.direction:a.getComputedStyle?a.getComputedStyle(a.document.body).getPropertyValue("direction"):"";if("ltr"===h&&g){e=Math.min(1200,g-e.getBoundingClientRect().left);break a}if("rtl"===h&&g){e=a.document.body.getBoundingClientRect().right-
e.getBoundingClientRect().right;e=Math.min(1200,g-e-Math.floor((g-a.document.body.clientWidth)/2));break a}}e=-1}0<=e&&d>e&&(N(Q(a),f.VIEWPORT)?c.google_ad_width=e:N(Q(a),f.H)&&(f=Bc(e,a,b).j,c.google_ad_width=300<e&&300<f.j?f.l:Math.min(1200,Math.round(e)),c.google_ad_height=f.height(),c.google_ad_format=(300<e&&300<f.j?f.l:Math.min(1200,Math.round(e)))+"x"+f.height()))}f=x("script");b={};d=c.google_ad_height;b.width='"'+c.google_ad_width+'"';b.height='"'+d+'"';b.frameborder='"0"';b.marginwidth=
'"0"';b.marginheight='"0"';b.vspace='"0"';b.hspace='"0"';b.allowtransparency='"true"';b.scrolling='"no"';b.allowfullscreen='"true"';b.onload='"'+Ec+'"';var k;d=a.document;e=b.id;for(g=0;!e||d.getElementById(e);)e="aswift_"+g++;b.id=e;b.name=e;g=c.google_ad_width;h=c.google_ad_height;e=["<iframe"];for(k in b)b.hasOwnProperty(k)&&Lb(e,k+"="+b[k]);e.push('style="left:0;position:absolute;top:0;"');e.push("></iframe>");k=b.id;g="border:none;height:"+h+"px;margin:0;padding:0;position:relative;visibility:visible;width:"+
g+"px;background-color:transparent";d.write(['<ins id="',k+"_expand",'" style="display:inline-table;',g,'"><ins id="',k+"_anchor",'" style="display:block;',g,'">',e.join(" "),"</ins></ins>"].join(""));k=b.id;Vc(a,c);var b=$b(c),l;a:{try{if(window.JSON&&window.JSON.stringify&&window.encodeURIComponent){var q=window.encodeURIComponent(window.JSON.stringify(c)),n;try{n=pb(q)}catch(v){n="#"+pb(q,!0)}l=n;break a}}catch(v){O.j("sblob".toString(),v,void 0,void 0)}l=""}q=Uc(c.google_ad_client);n=(new Date).getTime();
l=["<!doctype html><html><body>",q,"<",f,">",b,"google_show_ads_impl=true;google_unique_id=",Nb(a),';google_async_iframe_id="',k,'";google_start_time=',r,";",l?'google_pub_vars = "'+l+'";':"","google_bpp=",n>r?n-r:1,";google_async_rrc=0;google_iframe_start_time=new Date().getTime();</",f,">",Rc(),"</body></html>"].join("");(a.document.getElementById(k)?Mc:Nc)(Sc(a,k,l,!0))}});}).call(this);