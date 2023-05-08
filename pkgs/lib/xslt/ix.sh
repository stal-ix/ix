{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.38/libxslt-v1.1.38.tar.bz2
sha:5c7855f989cfa9ece9901a4e106d018f091b5bf742c8161f559c0b1cb561d076
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
