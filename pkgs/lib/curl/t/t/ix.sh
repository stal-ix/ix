{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.14.1
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
6cf947ec831e8522b30d7fa8784ce5fcdf1f21581111861d82085a2729c59ba9
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-random="/dev/urandom"
{% endif %}
{% if darwin %}
--disable-ldap
{% endif %}
{% endblock %}
