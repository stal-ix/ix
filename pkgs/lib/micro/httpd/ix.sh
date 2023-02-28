{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.76.tar.gz
sha:f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c
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
