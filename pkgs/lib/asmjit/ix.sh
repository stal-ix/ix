{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/asmjit/asmjit
{% endblock %}

{% block git_commit %}
3577608cab0bc509f856ebf6e41b2f9d9f71acc4
{% endblock %}

{% block git_sha %}
735a0176b132df7469308552b6486b0b23078cf4cf8180f785927cd37c924147
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libasmjit.so libasmjit.a
{% endblock %}
