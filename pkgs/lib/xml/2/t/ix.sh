{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.13.1/libxml2-v2.13.1.tar.bz2
sha:1d3da819c2f202085a7c740356fd0dbe598757b9cb9949054812dd93a8757aa7
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
