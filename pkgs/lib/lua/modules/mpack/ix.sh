{% extends '//lib/lua/modules/t.sh' %}

{% block pkg_name %}
libmpack-lua
{% endblock %}

{% block version %}
1.0.13
{% endblock %}

{% block fetch %}
https://github.com/libmpack/libmpack-lua/archive/refs/tags/{{self.version().strip()}}.tar.gz
436a6a3973207403d3f20082002c32e74c25d9149ff2516dc06b0b41514044bf
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mpack
{% endblock %}

{% block cpp_defines %}
{{super()}}
MPACK_USE_SYSTEM=1
{% endblock %}
