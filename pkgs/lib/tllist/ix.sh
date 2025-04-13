{% extends '//die/c/meson.sh' %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/tllist/archive/{{self.version().strip()}}.tar.gz
sha:0e7b7094a02550dd80b7243bcffc3671550b0f1d8ba625e4dff52517827d5d23
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
