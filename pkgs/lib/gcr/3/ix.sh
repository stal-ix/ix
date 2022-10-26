{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/3.41.1/gcr-3.41.1.tar.bz2
sha:7e06e86e12aadaac6a72f2ee7eeaaaa6228a0ba3b92cadd50b45c0f05f0d91c6
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/3
{% endblock %}
