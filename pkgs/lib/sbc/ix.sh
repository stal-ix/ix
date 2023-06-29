{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
2.0
{% endblock %}

{% block git_sha %}
1a526e2a1fb09dafc7c450f0e7616c28106dc4a522f58c3af1c6b5b06ae963e8
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
