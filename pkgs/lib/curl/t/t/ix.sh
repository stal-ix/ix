{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-8_11_1.tar.gz
sha:78baef817c33a0a11b990d031a706dc1486f614b581e22949fc101add32c4cc8
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
