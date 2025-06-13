{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmicrohttpd
{% endblock %}

{% block version %}
1.0.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-{{self.version().strip()}}.tar.gz
a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94
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
