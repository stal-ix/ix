{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/asmjit/asmjit
{% endblock %}

{% block git_commit %}
3577608cab0bc509f856ebf6e41b2f9d9f71acc4
{% endblock %}

{% block git_sha %}
85ea3eea68eb3251532ad78c65c6cf7e4e5492405b509a223f5c25ca6674685a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
fix_cmake_lib
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libasmjit.{{target.dl_suffix}} libasmjit.a
{% endblock %}
