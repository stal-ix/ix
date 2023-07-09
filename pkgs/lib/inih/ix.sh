{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r57.tar.gz
sha:f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
