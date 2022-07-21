{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.35/libxslt-v1.1.35.tar.bz2
sha:2da1c2954f8a4e844f9d4e9110d1b31d45e7a5f8e9edc61823984861505e6e5d
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
