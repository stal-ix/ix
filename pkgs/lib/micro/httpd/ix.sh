{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmicrohttpd
{% endblock %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-{{self.version().strip()}}.tar.gz
df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7
{% endblock %}

{% block lib_deps %}
lib/c
lib/curl
lib/iconv
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/texinfo
bld/gettext
{% endblock %}
