{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.11.2/libxml2-v2.11.2.tar.bz2
sha:4da725ea3a87b49659dcd3742351319202f9f5317e45d0f3ead95f374e9a27ff
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
