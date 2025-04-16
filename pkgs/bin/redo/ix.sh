{% extends '//die/std/ix.sh' %}

{% block version %}
0.42d
{% endblock %}

{% block pkg_name %}
redo
{% endblock %}

{% block fetch %}
https://github.com/apenwarr/redo/archive/refs/tags/redo-{{self.version().strip()}}.tar.gz
sha:47056b429ff5f85f593dcba21bae7bc6a16208a56b189424eae3de5f2e79abc1
{% endblock %}

{% block bld_tool %}
bld/bash
bin/python/11
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block build %}
DESTDIR= PREFIX=${out} ./do build
{% endblock %}

{% block install %}
DESTDIR= PREFIX=${out} ./do install
{% endblock %}
