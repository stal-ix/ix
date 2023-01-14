{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://chromium.googlesource.com/libyuv/libyuv/+archive/3abd6f36b6e4f5a2e0ce236580a8bc1da3c7cf7e.tar.gz
sem:fa5405342008d2a37a252ee5e063c9f87729d9f3b3aae42ff0e2c0cba64837a1
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}

{% block bld_tool %}
bld/genpc
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
genpc "libyuv" "100.0.0"
{% endblock %}
