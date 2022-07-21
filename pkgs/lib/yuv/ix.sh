{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://chromium.googlesource.com/libyuv/libyuv/+archive/51c6d12e7deeb790dc8a85d1c50a942caffa516c.tar.gz
sem:34fbfefe6ecc99820be220959aad8c43a502c5cb80fb65c5cc617b07c2040620
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
