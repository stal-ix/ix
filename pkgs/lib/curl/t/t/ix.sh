{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.23.0
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
d0605d5883124ef5ae64c6d2b307e1417c482b362583b57491fdf37d9a99a792
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
