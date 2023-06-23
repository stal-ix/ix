{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/asmjit/asmjit
{% endblock %}

{% block git_commit %}
3577608cab0bc509f856ebf6e41b2f9d9f71acc4
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_sha %}
4773e324aadf2022dcb318087fffefea04b0a6505ac60feb832550cad07313cc
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
