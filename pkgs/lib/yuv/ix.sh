{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/libyuv/libyuv
{% endblock %}

{% block git_commit %}
a34a0ba68781d0d1914597449d871775dad50984
{% endblock %}

{% block git_branch %}
main
{% endblock %}

{% block git_sha %}
2cadc78ead188a47be18686c50a3c66dc071e2ba6cfbcae3986c7c3c98aeddfd
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
