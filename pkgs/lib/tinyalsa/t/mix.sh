{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/tinyalsa/tinyalsa/archive/refs/tags/v2.0.0.tar.gz
sha:573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
