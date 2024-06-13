{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.40/libxslt-v1.1.40.tar.bz2
sha:fc5c5cc7ab2066c518355bfdbfa957851c68bcad834aabadf08347f5be04666c
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
