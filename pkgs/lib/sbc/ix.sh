{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
2.0
{% endblock %}

{% block git_sha %}
16d9d1d0d60fd57a6b178c11de6cd443019c5472ee55c95ceae345140e491e0b
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
