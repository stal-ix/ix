{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/libyuv/libyuv
{% endblock %}

{% block git_commit %}
a34a0ba68781d0d1914597449d871775dad50984
{% endblock %}

{% block git_sha %}
5bcef7c45526a631a7e77331789690930a97632dadef27b280b92b79b7cfcfd5
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

{% block git_version %}
v3
{% endblock %}
