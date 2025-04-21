{% extends '//lib/lua/modules/t.sh' %}

{% block pkg_name %}
libmpack-lua
{% endblock %}

{% block version %}
1.0.12
{% endblock %}

{% block fetch %}
https://github.com/libmpack/libmpack-lua/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:7c3f0a5fcd0d7c169fd7bc95978412628d8f59eb9da1d32cf3e8a864b741ec92
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mpack
{% endblock %}

{% block cpp_defines %}
{{super()}}
MPACK_USE_SYSTEM=1
{% endblock %}
