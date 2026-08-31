{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.128
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
70ea638f4e4fc341b24782ef9af6d88a2d3280ef5e46736748411fe8ca586351
{% endblock %}
