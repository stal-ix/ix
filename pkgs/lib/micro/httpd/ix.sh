{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.1.tar.gz
sha:a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94
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
