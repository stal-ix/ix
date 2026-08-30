{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pax-utils
{% endblock %}

{% block version %}
1.3.11
{% endblock %}

{% block fetch %}
https://github.com/gentoo/pax-utils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
aa01db76341e64c9c6895d83f6b5f835a3cc9efdf1c21c72b8e45f1b0add32c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block meson_flags %}
tests=false
use_fuzzing=false
{% endblock %}
