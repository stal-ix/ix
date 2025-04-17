{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxml2
{% endblock %}

{% block version %}
2.14.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v{{self.version().strip()}}/libxml2-v{{self.version().strip()}}.tar.bz2
sha:08d80cd5f5b340b0c6803239fafed480eccf33a0c9b474ae020912c87f19380e
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
