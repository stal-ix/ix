{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmicrohttpd
{% endblock %}

{% block version %}
1.0.10
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-{{self.version().strip()}}.tar.gz
04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685
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
