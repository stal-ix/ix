{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libscfg
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block fetch %}
https://codeberg.org/emersion/libscfg/archive/v{{self.version().strip()}}.tar.gz
cf37ef00ac8efb28821dac1ad49e2c6b23b242d9d961fab6fcda72fc73a7291b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
