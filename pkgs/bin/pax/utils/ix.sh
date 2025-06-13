{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pax-utils
{% endblock %}

{% block version %}
1.3.8
{% endblock %}

{% block fetch %}
https://github.com/gentoo/pax-utils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
60a3ae882b0722806aa4f8f0f6256271553259eee0d3875f16c0e3b604503847
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block meson_flags %}
tests=false
use_fuzzing=false
{% endblock %}
