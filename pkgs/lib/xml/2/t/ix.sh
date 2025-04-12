{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxml2
{% endblock %}

{% block version %}
2.13.7
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v{{self.version().strip()}}/libxml2-v{{self.version().strip()}}.tar.bz2
sha:b940402ba9f89cd6ddc0a80b12d748587efef68e335ec7fb17b32303db868563
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
