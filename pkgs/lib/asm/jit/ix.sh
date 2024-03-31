{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/asmjit/asmjit
{% endblock %}

{% block git_commit %}
3577608cab0bc509f856ebf6e41b2f9d9f71acc4
{% endblock %}

{% block git_sha %}
71f072fbb23afcf3230dd9047567c5fc753215749b0cec68c3dc2f08234994d0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block git_version %}
v3
{% endblock %}
