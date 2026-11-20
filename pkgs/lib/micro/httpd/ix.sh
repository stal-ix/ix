{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmicrohttpd
{% endblock %}

{% block version %}
1.0.11
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-{{self.version().strip()}}.tar.gz
f227a044b75688e449b58ddedf0582255cc562899ff69f173a8ef76439744b4e
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
