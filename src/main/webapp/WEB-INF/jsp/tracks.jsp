<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp"%>
<% pageContext.setAttribute("lf", "\n"); %>

<title>Tracks</title>

<div style="margin-top: 20px" class="col-md-10 col-md-offset-1">
	<h2>Tracks</h2>
</div>

<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<table class="table table-hover">
			<thead>
				<tr><th>Track</th><th>Sessions</th></tr>
			</thead>
			<tbody>
				<c:forEach items="${trackList.tracks}" var="track">
				<tr>
					<td><c:out value="${track.name}" /></td>
					<td><c:out value="${track.presentations.size()}" /></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

