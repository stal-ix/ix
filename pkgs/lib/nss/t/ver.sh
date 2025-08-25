{% block pkg_name %}
nss
{% endblock %}

{% block version %}
3.115.1
{% endblock %}

{% block fetch_impl %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_{{self.version().strip().replace('.', '_')}}_RTM/src/nss-{{self.version().strip()}}.tar.gz
b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf
{% endblock %}
