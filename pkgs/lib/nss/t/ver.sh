{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.113
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f
{% endblock %}
