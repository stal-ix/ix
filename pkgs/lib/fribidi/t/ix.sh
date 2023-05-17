{% extends '//die/c/meson_cross.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.13.tar.gz
sha:f24e8e381bcf76533ae56bd776196f3a0369ec28e9c0fdb6edd163277e008314
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}
