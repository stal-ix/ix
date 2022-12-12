{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/tllist/archive/1.1.0.zip
sha:e75061ceac622a24e118bd78c6c129545a0ce060f71b6cd30494ff76a3d2b6d4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
