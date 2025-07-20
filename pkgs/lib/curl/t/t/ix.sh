{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.15.0
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
2937cadde007aa3a52a17c21ac9153ea054700f37926d1d96602bf07e888c847
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
