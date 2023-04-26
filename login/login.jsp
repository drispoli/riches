<%@ include file="../pages/common/moduleInclude.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>RWI - Riches Wealth International Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html" />
<script language="javascript">AC_FL_RunContent = 0;</script>
<script src="<s:url value="/js/AC_RunActiveContent.js"/>" language="javascript"></script>
<link rel="stylesheet" type="text/css" href="<s:url value="/css/rwi-2.css"/>" />
<link rel="shortcut icon" href="<s:url value="/img/favicon.ico"/>" />
</head>
<body>
<br />
<table cellpadding="0" cellspacing="0" id="content" border="0" align="center">
	<tr valign="mtop">
		<td colspan="2">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr valign="middle">
					<td id="utilities" align="right"><a href="<s:url value="/"/>">Find Locations</a> | <a href="<s:url value="/"/>">Contact Us</a> | <a href="<s:url value="/"/>">Site Map</a>&nbsp;</td>
					<td id="search" align="right" ><form id="search" action="" method="get" >
							<input type="text" size="28" maxlength="75" name="query" id="searchbox" title="Search" height="24" align="absmiddle" />
							<input type="image" src="<s:url value="/img/btn_search_white.gif" includeParams="none"/>" alt="Search" name="searchBtn" id="searchbtn"  align="absmiddle" disabled/>
						</form></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td align="left"><img id="header" src="<s:url value="/img/header.gif" includeParams="none"/>" /></td>
	</tr>
	<tr valign="top" id="menubar">
		<td colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" align="right">
				<tr valign="top">
					<td><a href="<s:url value="/"/>" title="Personal Banking Services">Personal</a></td>
					<td><a href="<s:url value="/"/>" title="Small Business. Serving businesses with up to $20 million in annual revenue">Small Business</a></td>
					<td><a href="<s:url value="/"/>" title="Commercial. Serving businesses with over $20 million in annual revenue">Commercial</a></td>
					<td><a href="<s:url value="/"/>" title="Information About RWi">About RWi</a></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr valign="top">
					<td>
						<table cellpadding="0" cellspacing="0" border="0" align="left" id="left">
							<tr valign="top">
								<td>
									<table cellpadding="0" cellspacing="0" border="0" id="onlinebanking">
									<tr valign="top">
										<td id="signon_title">RWi Online Banking</td>
									</tr>
									<tr valign="top">
<%--                                        
                                        <td id="accounts" width="100%" height="30"><form action="" method="post" name="signon" >
												<label for="accounts">Go to</label>
												:&nbsp;
												<select id="goto" name="accounts" id="accounts" style="margin-left:4px">
												<option value="AccountSummary" selected="selected">Account Summary</option>
												<option value="Transfer">Transfer</option>
												<option value="Messages">Messages &amp; Alerts</option>
                                                </select>
											</form>
										</td>
--%>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <c:when test="${param.errorMsg != null}" >
                                                    <font color="red">${param.errorMsg}</font>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr valign="top">
										<td id="userid">

                                            <s:form action="j_security_check" method="GET" theme="simple">
                                                <strong><s:label value="Username:" for="j_username" /></strong><br />
                                                <s:textfield name="j_username" id="j_username" maxLength="50" cssStyle="width:140px"/><br />
                                                <strong><s:label value="Password:" for="j_username" /></strong><br />
                                                <s:password name="j_password" id="j_password" maxLength="50" cssStyle="width:140px"/>
                                                <input type="image" align="absmiddle" alt="Go" src="<s:url value="/img/btn_go_white.gif" includeParams="none"/>" value="Submit"/>
                                                <%-- <s:submit align="absmiddle" type="image" src="/riches/img/btn_go_white.gif"/> align doesn't work--%>
                                            </s:form>

											<p id="signup">Need to set up online access?<br/>
												<a href="<s:url action="Register"/>">Sign Up Now</a> or <a href="<s:url value="/"/>">Take a Tour</a></p>
										</td>
									</tr>
									<tr valign="top">
										<td>
											<img align="middle" src="<s:url value="/img/horizontall.gif" includeParams="none"/>" />
										</td>
									</tr>
									<tr valign="top">
										<td>
											<h2>Account Services</h2>
											<p id="services"> <a href="<s:url value="/"/>">Visit our Tax Center</a><br />
												<a href="<s:url value="/"/>">Get Mobile Banking</a><br />
												<a href="<s:url value="/"/>">Try Online Statements</a><br />
												<a href="<s:url value="/"/>">&gt;&gt;&nbsp;More</a></p>
										</td>
									</tr>
									<tr valign="top">
										<td>
											<img align="middle" src="<s:url value="/img/horizontall.gif" includeParams="none"/>" />
										</td>
									</tr>
									<tr valign="top">
										<td>
											<h2>Find ATMs/Locations</h2>
											<form id="locator" action="" >
												<input type="text" size="28" maxlength="70" id="location" name="location" value="Enter Zip code or City & State" title="Find atms/locations" style="float:left;width:147px" onclick="this.select();this.style.color='#000';" onfocus="this.select();this.style.color='#000';"/>
												<input type="image" src="<s:url value="/img/btn_go_white.gif" includeParams="none"/>" id="locationGo" name="locationGo" alt="Go" style="clear:right;margin:1px 0 0 5px;padding:0" disabled/>
											</form>
										</td>
									</tr>
									<tr valign="top">
										<td>
											<img align="middle" src="<s:url value="/img/horizontall.gif" includeParams="none"/>" />
										</td>
									</tr>
									<tr valign="top">
										<td>
											<h2>Fraud Prevention &amp; <br/>
												Online Security</h2>
											<p id="services"> <a href="<s:url value="/"/>">Report Suspicious Email</a><br />
												<a href="<s:url value="/"/>">Fraud &amp; Identity Theft</a><br />
												<a href="<s:url value="/"/>">RWi Security Plus&trade;</a><br />
												<a href="<s:url value="/"/>">Our Online Security Guarantee</a></p>
										</td>
									</tr>
							</table>
								</td>
							</tr>
							<tr valign="top">
								<td>
								<table cellpadding="0" cellspacing="0" border="0" id="bg_image">
									<tr valign="top">
										<td>
											<img width="248" src="<s:url value="/img/accounts_bg_home.gif" includeParams="none"/>" />
										</td>
									</tr>
								</table>
							</td>
							</tr>
							<tr valign="top">
								<td><br /></td>
							</tr>
						</table>
					</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" align="right" id="right">
							<tr valign="top">
								<td colspan="3">
									<script language="javascript">
										if (AC_FL_RunContent == 0) {
											alert("This page requires AC_RunActiveContent.js.");
										} else {
											AC_FL_RunContent(
												'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
												'width', '731',
												'height', '194',
												'src', 'rwi-1',
												'quality', 'high',
												'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
												'align', 'middle',
												'play', 'true',
												'loop', 'true',
												'scale', 'showall',
												'wmode', 'window',
												'devicefont', 'false',
												'id', 'rwi-1',
												'bgcolor', '#ffffff',
												'name', 'rwi-1',
												'menu', 'true',
												'allowFullScreen', 'false',
												'allowScriptAccess','sameDomain',
												'movie', '<s:url value="/rwi-1" includeParams="none"/>',
												'salign', ''
												); //end AC code
										}
									</script>
									<noscript>
										<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="731" height="194" id="rwi-1" align="middle">
										<param name="allowScriptAccess" value="sameDomain" />
										<param name="allowFullScreen" value="false" />
										<param name="movie" value="rwi-1.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="<s:url value="/rwi-1.swf" includeParams="none"/>" quality="high" bgcolor="#ffffff" width="731" height="194" name="rwi-1" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
										</object>
									</noscript> 
								</td>
							</tr>
							<tr valign="top" class="links">
								<!-- 1st row -->
								<td width="33%" ><h2 class="row1title">&nbsp;&nbsp;Banking</h2>
									<a href="<s:url value="/"/>">Checking</a><br />
									<a href="<s:url value="/"/>" title ="Start Saving Today">Savings &amp; CDs</a><br />
									<a href="<s:url value="/"/>" title ="Click here for Rewards">Credit Cards</a><br />
									<a href="<s:url value="/"/>" title ="Enroll for Free!">Online Banking</a><br />
									<a href="<s:url value="/"/>" title ="Get Started for Free">Bill Pay</a><br />
									<a href="<s:url value="/"/>" class="last" title="More Banking Accounts and Services"><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
								<td width="33%"><h2 class="row1title">&nbsp;&nbsp;Loans</h2>
									<a href="<s:url value="/"/>" title ="Sign up to Get Rate Email Alerts">Home Mortgage</a><br />
									<a href="<s:url value="/"/>" title ="Learn about Home Equity">Home Equity Loans</a><br />
									<a href="<s:url value="/"/>" title ="Personal Loan Rates and Payments">Personal Loans</a><br />
									<a href="<s:url value="/"/>" title ="Automobile Loan Rates and Payments">Auto Loans</a><br />
									<a href="<s:url value="/"/>" title ="Get a Student Loan">Student Loans</a><br />
									<a href="<s:url value="/"/>" class="last" title="More loans and credit options" ><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
								<td width="33%"><h2 class="row1title" class="inv">&nbsp;&nbsp;Investing</h2>
									<a href="<s:url value="/"/>" title ="Open an Account Today">Mutual Funds</a><br />
									<a href="<s:url value="/"/>" title ="Find Out About Commission-Free Trades">Brokerage</a><br />
									<a href="<s:url value="/"/>" title ="Start Saving for Your Future Now!">Retirement Planning</a><br />
									<a href="<s:url value="/"/>" title ="Protect Your Family">Insurance</a><br />
									<a href="<s:url value="/"/>" title ="Your own Private Bank">Private Banking</a><br />
									<a href="<s:url value="/"/>" class="last" title="More investing and insurance"><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
							</tr>
							<tr valign="top" class="links">
								<!-- 2st row -->
								<td width="33%"><h2 class="row2title">&nbsp;&nbsp;Open an Account</h2>
									<a href="<s:url value="/"/>" title ="Open a Checking Account Today">Checking Account</a><br />
									<a href="<s:url value="/"/>" title ="Open a Saving Account Today">Savings Account</a><br />
									<a href="<s:url value="/"/>" title ="Apply For a Credit Card">Credit Cards</a><br />
									<a href="<s:url value="/"/>" title ="Open a CD Account Today">CD's</a><br />
									<a href="<s:url value="/"/>" title ="Open Money Market Account">Money Market Account</a><br />
									<a href="<s:url value="/"/>" class="last" title="Other Types of Accounts"><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
								<td width="34%"><h2 class="row2title">&nbsp;&nbsp;Check on Today's Rates</h2>
									<a href="<s:url value="/"/>" title ="">Mortgage</a><br />
									<a href="<s:url value="/"/>" title ="">Home Equity</a><br />
									<a href="<s:url value="/"/>" title ="">Credit Cards</a><br />
									<a href="<s:url value="/"/>" title ="">Persoal Loans</a><br />
									<a href="<s:url value="/"/>" title ="">Auto Loans</a><br />
									<a href="<s:url value="/"/>" class="last" title="Get Other Rates" ><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
								<td width="33%"><h2 class="row2title" class="inv">&nbsp;&nbsp;Other Services</h2>
									<a href="<s:url value="/"/>" title ="">Retirement Center</a><br />
									<a href="<s:url value="/"/>" title ="">Buying a Home</a><br />
									<a href="<s:url value="/"/>" title ="">College Planning</a><br />
									<a href="<s:url value="/"/>" title ="">Consolidating Debt</a><br />
									<a href="<s:url value="/"/>" title ="">Investment Tools</a><br />
									<a href="<s:url value="/"/>" class="last" title=""><strong>&gt;&gt;</strong>&nbsp;More</a>
								</td>
							</tr>
							<tr valign="top" class="links">
								<!-- 3rd row -->
								<td><br />
									<img src="<s:url value="/img/small-ad3.gif" includeParams="none"/>" />
								</td>
								<td><br />
									<img style="margin-left:.25em;" src="<s:url value="/img/small-ad1.gif" includeParams="none"/>" />
								</td>
								<td><br />
									<img src="<s:url value="/img/small-ad2.gif" includeParams="none"/>" />
								</td>
							</tr>
							<tr valign="top" class="footer">
								<td colspan="3">
								<br />
									<p id="footerNav"><a href="<s:url value="/"/>">About RWi</a> | <a href="<s:url value="/"/>">Careers</a> | <a href="<s:url value="/"/>">Privacy, Security &amp; Legal</a> | <a href="<s:url value="/"/>">Report Email Fraud</a> | <a href="<s:url value="/"/>">Diversity &amp; Accessibility</a>  <br /><a href="<s:url value="/"/>">Important Notice on Trading in Fast Markets</a> | <a href="<s:url value="/"/>">Online Access Agreement (3/06/2008) </a> | <a href="<s:url value="/"/>">Sitemap</a></p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table cellpadding="0" cellspacing="0" border="0" align="center">
				<tr valign="top">
					<td>
						<p id="copy"><img src="<s:url value="/img/al_ehl_house_gen.gif" includeParams="none"/>" alt="" width="14" height="10" style="padding:0 5px 0 15px" /><strong style="color:#000">Equal Housing Lender</strong><br />RWi, Member FDIC. &copy; 2008 RWI. All rights reserved. </p>
					</td>
				</tr>
			</table>
			<br />
		</td>
	</tr>
</table>
</body>
</html>
