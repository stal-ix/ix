{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v0.0.12.tar.gz
sha:b26b01f4540259784955d224a6adf91f4cff5f38fb64f6098984bf91df8fbd8f
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}
