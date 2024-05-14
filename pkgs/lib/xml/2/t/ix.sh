{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.7/libxml2-v2.12.7.tar.bz2
sha:f86f918e2884675cc0778c644fbc15e3ccbf06fb7fcf24eacd286976c99a6266
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block configure_flags %}
--with-ftp=off
--with-http=no
--with-modules=off
--disable-python
--without-python
--with-legacy
--with-sax1
{% endblock %}
