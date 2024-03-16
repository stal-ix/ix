{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.6/libxml2-v2.12.6.tar.bz2
sha:69f08b81d4532d285ceea4cdb017eb2d948cb87c34c1d64248a92be90e84132d
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
--with-legacy
--with-sax1
{% endblock %}
