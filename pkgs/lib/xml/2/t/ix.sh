{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.0/libxml2-v2.12.0.tar.bz2
sha:821bcc2559c2c5185575edf1ccc470632492d3f0a72365d87c7704c9d6e072c0
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
