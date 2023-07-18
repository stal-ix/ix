{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/apenwarr/redo/archive/refs/tags/redo-0.42d.tar.gz
sha:47056b429ff5f85f593dcba21bae7bc6a16208a56b189424eae3de5f2e79abc1
{% endblock %}

{% block bld_tool %}
bld/bash
bin/python/11
{% endblock %}

{% block build %}
DESTDIR= PREFIX=${out} ./do build
{% endblock %}

{% block install %}
DESTDIR= PREFIX=${out} ./do install
{% endblock %}

{% block postinstall %}
:
{% endblock %}
