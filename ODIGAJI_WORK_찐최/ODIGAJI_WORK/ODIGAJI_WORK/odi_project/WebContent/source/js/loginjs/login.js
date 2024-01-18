function redirectToPage(url) {
        window.location.href = "${pageContext.request.contextPath}/" + url;
    }