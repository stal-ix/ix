{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.22.0
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
222c6b5c1f368ac63aed59bce2774eb5def9e8e67e46e800be182e684d2845a3
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-random="/dev/urandom"
{% endif %}
{% if darwin %}
--disable-ldap
{% endif %}
{% endblock %}
