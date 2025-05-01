{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.110
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
sha:9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27
{% endblock %}
