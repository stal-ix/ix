{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.75.tar.gz
sha:9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/curl
lib/iconv
lib/gnutls
{% endblock %}

{% block bld_tool %}
bin/texinfo
bld/gettext
{% endblock %}
