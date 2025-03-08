{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/maryla-uc/libargparse/archive/49170d4e27da404c4f1093dce6cf7a64dd34ce38.zip
sha:d5f9fb9e9bd4d0c35899f5c2af11f65865c487a8864988038209aae6683cb7be
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake(lib_name=libargparse)
{% endblock %}

{% block env %}
export CPPFLAGS="-iquote ${out}/include \${CPPFLAGS}"
{% endblock %}
