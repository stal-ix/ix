{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/libyuv/libyuv
{% endblock %}

{% block git_commit %}
a34a0ba68781d0d1914597449d871775dad50984
{% endblock %}

{% block git_sha %}
c0daf64cc8e6ada4844dc316a6b6e689a420a0d5ce8d9094850857e14394769c
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
lib/shim/fake/pkg(pkg_name=libyuv,pkg_ver=100.0.0)
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
