{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/tllist/archive/1.1.0.tar.gz
sha:0e7b7094a02550dd80b7243bcffc3671550b0f1d8ba625e4dff52517827d5d23
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
