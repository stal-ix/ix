{% extends '//lib/lua/modules/t.sh' %}

{% block pkg_name %}
libmpack-lua
{% endblock %}

{% block version %}
1.0.9
{% endblock %}

{% block fetch %}
https://github.com/libmpack/libmpack-lua/archive/refs/tags/{{self.version().strip()}}.tar.gz
md5:a2d0d5e25aefc7b3b51c816de8096fd6
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mpack
{% endblock %}

{% block cpp_defines %}
{{super()}}
MPACK_USE_SYSTEM=1
{% endblock %}
