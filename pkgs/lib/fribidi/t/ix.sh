{% extends '//die/c/meson_cross.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.16.tar.gz
sha:5a1d187a33daa58fcee2ad77f0eb9d136dd6fa4096239199ba31e850d397e8a8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}
