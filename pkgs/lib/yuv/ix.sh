{% extends '//die/cmake.sh' %}

{% block fetch %}
https://chromium.googlesource.com/libyuv/libyuv/+archive/51c6d12e7deeb790dc8a85d1c50a942caffa516c.tar.gz
sem:
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
{{hooks.gen_pc('libyuv', '100.0.0')}}
{% endblock %}
