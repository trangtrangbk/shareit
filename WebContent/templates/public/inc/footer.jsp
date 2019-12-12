<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/jquery-3.2.1.js"></script>    
<footer id="footer" class="footer-inverse" role="contentinfo">
			<div id="footer-inner">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-12">
							<a class="islemag-footer-logo" href="https://demo.themeisle.com/islemag/"><img src="/shareit/templates/public/logo.jpeg" alt=""></a>
							<div class="islemag-footer-content">
								<p>VINAENTER - ĐÃ HỌC LÀ LÀM ĐƯỢC <a href="HTTP://VINAENTER.EDU.VN/">HTTP://VINAENTER.EDU.VN/</a> </p>
          					</div><span class="social-icons-label">FIND US AT:</span>
          					<div class="footer-social-icons">
								<a href="#" class="footer-social-icon"><i class="fa fa-twitter"></i></a>
								<a href="#" class="footer-social-icon"><i class="fa fa-facebook"></i></a>
								<a href="#" class="footer-social-icon"><i class="fa fa-instagram"></i></a>
								<a href="#" class="footer-social-icon"><i class="fa fa-linkedin"></i></a>
							</div><!-- .footer-social-icons -->
						</div>
					</div>
				<!-- .col-md-3.col-sm-6 -->
					<div id="pirate_forms_contact_widget-2" class="widget construct">
						<div class="pirate-forms-contact-widget">
							<h3 class="widget-title">Contact us</h3>
								<div class="pirate_forms_container widget-yes" id="pirate_forms_container_default">
								<div id="msg">
									
								</div>
									<div class="pirate_forms_wrap">
										<!-- errors -->
										<!-- form -->
										<form enctype="application/x-www-form-urlencoded"
											class="pirate_forms widget-on form_honeypot-on pirate_forms_from_widget-on pirate-forms-contact-name-on pirate-forms-contact-email-on pirate-forms-contact-subject-on pirate-forms-contact-message-on pirate-forms-contact-submit-on pirate-forms-contact-referrer-on referring-page-on pirate_forms_from_form-on" >
											<div class="pirate_forms_three_inputs_wrap ">
												<div class="col-xs-12 pirate_forms_three_inputs form_field_wrap contact_name_wrap col-xs-12 col-sm-6 contact_name_wrap pirate_forms_three_inputs form_field_wrap">
													<input id="name" type="text" class="form-control" name="name" placeholder="Your Name" required oninvalid="this.setCustomValidity('Enter your name')" value="" >
												</div>
												<div class="col-xs-12 pirate_forms_three_inputs form_field_wrap contact_email_wrap col-xs-12 col-sm-6 contact_email_wrap pirate_forms_three_inputs form_field_wrap">
													<input  type="email" class="form-control" id="email" name="email" placeholder="Your Email" required oninvalid="this.setCustomValidity('Enter a valid email')" onchange="this.setCustomValidity('')" value="" >
												</div>
												<div class="col-xs-12 pirate_forms_three_inputs form_field_wrap contact_subject_wrap col-xs-12 contact_subject_wrap pirate_forms_three_inputs form_field_wrap">
													<input  type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required oninvalid="this.setCustomValidity('Please enter a subject')" onchange="this.setCustomValidity('')" value="" >
												</div>
											</div>
											<div class="col-xs-12 form_field_wrap contact_message_wrap col-xs-12 contact_message_wrap pirate_forms_three_inputs form_field_wrap">
												<textarea rows="5" cols="30" class="form-control" id="message" name="message" class="" placeholder="Your message" required oninvalid="this.setCustomValidity('Enter your question or comment')" onchange="this.setCustomValidity('')" ></textarea>
											</div>
											<div class="col-xs-12 form_field_wrap contact_submit_wrap">
<!-- 												<button type="submit" class="pirate-forms-submit-button btn btn-primary " id="pirate-forms-contact-submit" name="pirate-forms-contact-submit" class="pirate-forms-submit-button btn btn-primary " placeholder="" >Send Message</button>
 -->												<a href="javascript:void(0)" title="" class="pirate-forms-submit-button btn btn-primary" onclick="return xulyguilienhe()">Send Message</a>
											</div>
											</form>

									</div>
								</div>
					</div>	
				</div>
		<div class="pirate_forms_clearfix"></div>
	</div>
</div>
</footer>
	<!-- footer -->
	<script type="text/javascript">
				function xulyguilienhe(){		
					var name=$("#name").val();
					var email=$("#email").val();
					var subject=$("#subject").val();
					var message=$("#message").val();
					$.ajax({
						url: '<%=request.getContextPath() %>/admin/contact/add',
						type: 'POST',
						cache: false,
						data: {aname:name,aemail:email,asubject:subject,amessage:message},
						success: function(data){
							$("#msg").html(data);
						},
						error: function (){
							alert('Có lỗi xảy ra');
						}
					});
					
					return false;
				}
						
			</script>
<script type="text/javascript">
var sbiajaxurl = "https://demo.themeisle.com/islemag/wp-admin/admin-ajax.php";
</script>
        <!--facebook like and share js -->
        <div id="fb-root"></div>
		<script>(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
		  	if (d.getElementById(id)) return;
		  	js = d.createElement(s); js.id = id;
		  	js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
		  	fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<!--<div id="fb-root"></div>
        <script>
        (function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1425108201100352&version=v2.0";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>-->
 	         <!--google share and  like and e js -->
        <script type="text/javascript">
            window.___gcfg = {
              lang: 'en-US'
            };
            (function() {
                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                po.src = 'https://apis.google.com/js/plusone.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
            })();
        </script>
		
		<!-- google share -->
        <script type="text/javascript">
          (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/platform.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
          })();
        </script>
			<!--pinit js -->
		<script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
			<!-- twitter JS End -->
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>	
	             <script>
                jQuery( document ).scroll(function( $ )
                {
                    var y = jQuery(this).scrollTop();
            
                    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
                    {    
                       if(jQuery(window).scrollTop() + jQuery(window).height() >= jQuery(document).height()-100)
                       {
                          jQuery('.sfsi_outr_div').css({'z-index':'9996',opacity:1,top:jQuery(window).scrollTop()+"px",position:"absolute"});
                          jQuery('.sfsi_outr_div').fadeIn(200);
                          jQuery('.sfsi_FrntInner_chg').fadeIn(200);
                       }
                       else{
                           jQuery('.sfsi_outr_div').fadeOut();
                           jQuery('.sfsi_FrntInner_chg').fadeOut();
                       }
                  }
                  else
                  {
                       if(jQuery(window).scrollTop() + jQuery(window).height() >= jQuery(document).height()-3)
                       {
                            jQuery('.sfsi_outr_div').css({'z-index':'9996',opacity:1,top:jQuery(window).scrollTop()+200+"px",position:"absolute"});
                            jQuery('.sfsi_outr_div').fadeIn(200);
                            jQuery('.sfsi_FrntInner_chg').fadeIn(200);
                       }
                       else
                       {
                         jQuery('.sfsi_outr_div').fadeOut();
                         jQuery('.sfsi_FrntInner_chg').fadeOut();
                       }
                  } 
                });
             </script>
                	<script>
			jQuery(document).ready(function(e) {
                jQuery("body").addClass("sfsi_2.04")
            });
			function sfsi_processfurther(ref) {
				var feed_id = 'ZjhIOTJuNE1LZ1Y1VFUvV2FlSEFwQVRJVzNLcHFyYzFkNzdnVjU1cmR4QktNa0d0clJEc0x3V2RlOWpQZFY0Mk5XbkVpYnBQYVpPVlMrVC9XZWdseXJTWGNkU21xT2RIUTBPUGZJYW9XekE0UXdZTEttbGg4dkx2UEw1VDkyOFd8UmE0MytHd3RWbjFMMWg4cW1aM0IzbkxJL083WTRzbXlFRmVLM3dtaDc3VT0=';
				var feedtype = 8;
				var email = jQuery(ref).find('input[name="data[Widget][email]"]').val();
				var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if ((email != "Enter your email") && (filter.test(email))) {
					if (feedtype == "8") {
						var url ="https://www.specificfeeds.com/widgets/subscribeWidget/"+feed_id+"/"+feedtype;
						window.open(url, "popupwindow", "scrollbars=yes,width=1080,height=760");
						return true;
					}
				} else {
					alert("Please enter email address");
					jQuery(ref).find('input[name="data[Widget][email]"]').focus();
					return false;
				}
			}
		</script>
        <style type="text/css" aria-selected="true">
			.sfsi_subscribe_Popinner
			{
								width: 100% !important;
				height: auto !important;
												border: 1px solid #b5b5b5 !important;
								padding: 18px 0px !important;
				background-color: #ffffff !important;
			}
			.sfsi_subscribe_Popinner form
			{
				margin: 0 20px !important;
			}
			.sfsi_subscribe_Popinner h5
			{
				font-family: Helvetica,Arial,sans-serif !important;
								font-weight: bold !important;
								color: #000000 !important;
				font-size: 16px !important;
				text-align: center !important;
				margin: 0 0 10px !important;
    			padding: 0 !important;
			}
			.sfsi_subscription_form_field {
				margin: 5px 0 !important;
				width: 100% !important;
				display: inline-flex;
				display: -webkit-inline-flex;
			}
			.sfsi_subscription_form_field input {
				width: 100% !important;
				padding: 10px 0px !important;
			}
			.sfsi_subscribe_Popinner input[type=email]
			{
				font-family: Helvetica,Arial,sans-serif !important;
								font-style: normal !important;
								color:  !important;
				font-size: 14px !important;
				text-align: center !important;
			}
			.sfsi_subscribe_Popinner input[type=email]::-webkit-input-placeholder {
			   	font-family: Helvetica,Arial,sans-serif !important;
								font-style: normal !important;
								color:  !important;
				font-size: 14px !important;
				text-align: center !important;
			}
			.sfsi_subscribe_Popinner input[type=email]:-moz-placeholder { /* Firefox 18- */
			    font-family: Helvetica,Arial,sans-serif !important;
								font-style: normal !important;
								color:  !important;
				font-size: 14px !important;
				text-align: center !important;
			}
			.sfsi_subscribe_Popinner input[type=email]::-moz-placeholder {  /* Firefox 19+ */
			    font-family: Helvetica,Arial,sans-serif !important;
								font-style: normal !important;
								color:  !important;
				font-size: 14px !important;
				text-align: center !important;
			}
			.sfsi_subscribe_Popinner input[type=email]:-ms-input-placeholder {  
			  	font-family: Helvetica,Arial,sans-serif !important;
								font-style: normal !important;
								color:  !important;
				font-size: 14px !important;
				text-align: center !important;
			}
			.sfsi_subscribe_Popinner input[type=submit]
			{
				font-family: Helvetica,Arial,sans-serif !important;
								font-weight: bold !important;
								color: #000000 !important;
				font-size: 16px !important;
				text-align: center !important;
				background-color: #dedede !important;
			}
		</style>
	
<!-- Google Tag Manager (noscript) --><link rel='stylesheet' id='pirate_forms_front_styles-css'  href='https://s20206.pcdn.co/islemag/wp-content/plugins/pirate-forms/public/css/front.css?ver=2.4.4' type='text/css' media='all' />
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/js/islemag-wigdet.js?ver=1.0.0'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var sb_instagram_js_options = {"sb_instagram_at":"","font_method":"svg"};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/instagram-feed/js/sb-instagram.min.js?ver=1.9.1'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-includes/js/jquery/ui/core.min.js?ver=1.11.4'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/ultimate-social-media-icons/js/shuffle/modernizr.custom.min.js?ver=4.9.8'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/ultimate-social-media-icons/js/shuffle/jquery.shuffle.min.js?ver=4.9.8'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/ultimate-social-media-icons/js/shuffle/random-shuffle-min.js?ver=4.9.8'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var ajax_object = {"ajax_url":"https:\/\/demo.themeisle.com\/islemag\/wp-admin\/admin-ajax.php"};
var ajax_object = {"ajax_url":"https:\/\/demo.themeisle.com\/islemag\/wp-admin\/admin-ajax.php","plugin_url":"https:\/\/demo.themeisle.com\/islemag\/wp-content\/plugins\/ultimate-social-media-icons\/"};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/ultimate-social-media-icons/js/custom.js?ver=4.9.8'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/js/script.index.js?ver=1.0.0'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var screenReaderText = {"expand":"<span class=\"screen-reader-text\">expand child menu<\/span>","collapse":"<span class=\"screen-reader-text\">collapse child menu<\/span>"};
var stickyMenu = {"disable_sticky":"1"};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/js/script.all.js?ver=1.0.1'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/themes/islemag/js/owl.carousel.min.js?ver=2.0.0'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-includes/js/comment-reply.min.js?ver=4.9.8'></script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-includes/js/wp-embed.min.js?ver=4.9.8'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var pirateFormsObject = {"errors":"","rest":{"submit":{"url":"https:\/\/demo.themeisle.com\/islemag\/wp-json\/pirate-forms\/v1\/send_email\/"},"nonce":"d9e9dffc52"}};
/* ]]> */
</script>
<script type='text/javascript' src='https://s20206.pcdn.co/islemag/wp-content/plugins/pirate-forms/public/js/scripts.js?ver=2.4.4'></script>

<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.eu01.nr-data.net","licenseKey":"9767e3393c","applicationID":"605644","transactionName":"MhBSZQoZVxcAUxVYDAtacVIMEVYKTlYTXg0RWEBQHx0=","queueTime":0,"applicationTime":274,"atts":"HldRE0IDRBk=","errorBeacon":"bam.eu01.nr-data.net","agent":""}</script></body>
</html>
