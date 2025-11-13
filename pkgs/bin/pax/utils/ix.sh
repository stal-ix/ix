{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pax-utils
{% endblock %}

{% block version %}
1.3.9
{% endblock %}

{% block fetch %}
https://github.com/gentoo/pax-utils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d8db28f8f55d03b1f302b719857e9ffd6574ecade0c3b762ebd1c215e0a68754
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block meson_flags %}
tests=false
use_fuzzing=false
{% endblock %}
