{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/gentoo/pax-utils/archive/refs/tags/v1.3.8.tar.gz
sha:60a3ae882b0722806aa4f8f0f6256271553259eee0d3875f16c0e3b604503847
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block meson_flags %}
tests=false
use_fuzzing=false
{% endblock %}
