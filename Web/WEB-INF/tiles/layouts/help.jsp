<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="<s:url value="/web/resources/css/help.css" />?B=<s:property value="version" />" />
		<link rel="shortcut icon" href="<s:url value="/web/favicon.ico" />" />
		<script type="text/javascript" language="javascript">
		/* <![CDATA[ */
			//for use in javascript files that reference images
			var GLOBAL_baseImagePath = '<s:url value="/web/resources/images/" />';
			var GLOBAL_baseResourcePath = '<s:url value="/web/resources/" />';
		/* ]]> */
		</script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/default.js" />?B=<s:property value="version" />"></script>

		<title><s:text name="help.title"/></title>
	</head>
	<body>
		<s:include value="%{internationalizedBody}" />
	</body>
</html>