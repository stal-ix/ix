{% extends '//die/c/gn.sh' %}

{% block git_repo %}
https://github.com/google/angle
{% endblock %}

{% block git_commit %}
dcbcee8ab32af9ddc7ae1e91c42d995e5281602c
{% endblock %}

{% block git_sha %}
b1f884f1fcf87bfe168a4f1d734eb68c1884d28f6b413f783325dda6a57bfb1e
{% endblock %}

{% block git_hook_1 %}
git rm third_party/gles1_conform
git rm third_party/dawn
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block gn_args %}
angle_enable_vulkan=true
angle_use_wayland=true
{% endblock %}

{% block ninja_build_targets %}
libEGL.so
{% endblock %}
