{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.133
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065
{% endblock %}
