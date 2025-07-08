{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.113.1
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc
{% endblock %}
