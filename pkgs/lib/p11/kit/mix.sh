{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/archive/refs/tags/0.24.0.tar.gz
sha:284d209e045ebc7e30ccb479c7b559edfcb5433d665b497386dd35291826e39c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block c_rename_symbol %}
getprogname
{% endblock %}
