<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<div class="basicBox">
	<div class="itemLabel"><s:text name="notFound.label.notFound" /></div>
	<div class="itemContents"><s:property value="message" /></div>
</div>