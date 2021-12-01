{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.11.tar.gz
2acb412d284f5918de3638c1052160dd
{% endblock %}

{% block meson_flags %}
-Ddocs=false
-Dtests=false
{% endblock %}
