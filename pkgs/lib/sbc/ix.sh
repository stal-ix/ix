{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
2.0
{% endblock %}

{% block git_sha %}
078efe273e3bc5f836e740163feef973ce5f710606a96d89b1d29bbb470de7d3
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
