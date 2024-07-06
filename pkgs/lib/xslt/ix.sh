{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.42/libxslt-v1.1.42.tar.bz2
sha:1df3134451708a0098850f9b9e8d86734af7a08f5bea5890f7a3e02b9ccd59d9
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
