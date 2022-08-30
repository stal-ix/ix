{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.37/libxslt-v1.1.37.tar.bz2
sha:6dbeb21aa8c938e6a39010901c0e84122bb87225b4af31f76feb4e3a5b138a5c
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
