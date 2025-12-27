{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pax-utils
{% endblock %}

{% block version %}
1.3.10
{% endblock %}

{% block fetch %}
https://github.com/gentoo/pax-utils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4ee86899b0cb8b702f443908dc4e9e5e19a2bd870d0520cbae4066658c89df14
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block meson_flags %}
tests=false
use_fuzzing=false
{% endblock %}
