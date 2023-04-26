<tr valign="top">
    <td colspan="2">
        <table cellpadding="0" cellspacing="0" border="0" width="100%" id="utilities">
            <tr valign="middle">
                <td align="right"><a href="<s:url value="/"/>">Bank Home</a> | <a href="<s:url value="/"/>">Find Locations</a> | <a href="<s:url value="/"/>">Contact
                    Us</a> | <a href="<s:url value="/"/>">Help</a> | <a href="<s:url value="/"/>">Privacy Policy</a> | <a href="<s:url value="/login/Logout.action"/>">Sign Off</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr valign="top">
    <td align="left">
        <img id="logo" src="<s:url value="/img/rwi_50.gif" includeParams="none"/>"/>
    </td>
</tr>
<tr valign="top" id="menubar">
    <td colspan="2">
        <table cellpadding="0" cellspacing="0" border="0" align="right">
            <tr valign="top">
                <td><a href="<s:url value="/auth/AccountSummary.action" includeParams="none"/>" title="Account Summary">Accounts</a></td>
                <td><a href="<s:url value="/auth/Transfer.action" includeParams="none"/>" title="">Transfer Funds</a></td>
                <td><a href="<s:url value="/auth/Check.action" includeParams="none"/>" title="">Write a Check</a></td>
<%--                <td><a href="" title="">Make Payments</a></td> --%>
                <td><a href="<s:url value="/auth/Messages.action" includeParams="none"/>" title="">Messages</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <c:if test="${auth}"><td><a href="<s:url namespace="/auth/oper" action="Admin" includeParams="none"/>" title="">Admin</a>&nbsp;&nbsp;&nbsp;&nbsp;</td></c:if>        
            </tr>
        </table>
    </td>
</tr>
