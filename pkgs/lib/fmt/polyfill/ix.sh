{% extends '//die/std/ix.sh' %}

{% block lib_deps %}
lib/fmt
{% endblock %}

{% block fetch %}
https://gitlab.com/ananicy-cpp/stl-polyfills/std-format/-/raw/45296602ad78a804411e7c3b617e13759f38e4e7/polyfills/format/format
sha:8135552b9e7e80191ef925f72fb1856fe680491eb37f6401fb3fff06decb4a62
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir ${out}/include
cp ${src}/format ${out}/include/
{% endblock %}
