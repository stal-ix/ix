{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.10.4/libxml2-v2.10.4.tar.bz2
sha:7465aa31a44fd93bc79ede260ee9f0e19623f4630eaa90b93977c80daa6300bf
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block configure_flags %}
--with-ftp=off
--with-http=off
--with-modules=off
--disable-python
--without-python
{% endblock %}
