{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.132
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff
{% endblock %}
