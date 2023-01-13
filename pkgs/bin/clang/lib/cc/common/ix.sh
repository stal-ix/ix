{% extends '//die/env.sh' %}

{% block env %}
export CC=clang
export CXX=clang++
export OBJC=clang
{% endblock %}
