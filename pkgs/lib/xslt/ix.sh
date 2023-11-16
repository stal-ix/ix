{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v1.1.39/libxslt-v1.1.39.tar.bz2
sha:78e3e1e56ad7b70480b069b5f0de8102f3c56604508a1a7d6eda9fcdfe74d841
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
