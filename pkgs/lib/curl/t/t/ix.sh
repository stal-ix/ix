{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.21.0
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
ec753aa6f408a3ca9f0d6d5f7a77417aecd1544db13c03ae5d443612bf367364
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
