{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.1.43
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v{{self.version().strip()}}/libxslt-v{{self.version().strip()}}.tar.bz2
sha:4e574ba219df34495f2ee63ae27bf904afa477c40d9a2969a330cf87f48053b6
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
