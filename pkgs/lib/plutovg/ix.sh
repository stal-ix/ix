{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v0.0.11.tar.gz
sha:f6c34ff2594566e1e7698098653b853cdbc77fafe96021300e65be9d16764f64
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}
