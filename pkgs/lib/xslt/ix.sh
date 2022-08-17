{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.36/libxslt-v1.1.36.tar.bz2
sha:9798e44a5fb0720cbda8a2323bb0e1db219659e9cd14fa4d73ee251ec281b3d4
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
