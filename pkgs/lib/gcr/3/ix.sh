{% extends '//lib/gcr/t/ix.sh' %}

{% block pkg_name %}
gcr
{% endblock %}

{% block version %}
3.41.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/{{self.version().strip()}}/gcr-{{self.version().strip()}}.tar.bz2
sha:7e06e86e12aadaac6a72f2ee7eeaaaa6228a0ba3b92cadd50b45c0f05f0d91c6
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/3
{% endblock %}
