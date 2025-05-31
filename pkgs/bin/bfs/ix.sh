{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bfs
{% endblock %}

{% block version %}
4.0.6
{% endblock %}

{% block fetch %}
https://github.com/tavianator/bfs/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:446a0a1a5bcbf8d026aab2b0f70f3d99c08e5fe18d3c564a8b7d9acde0792112
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/cap
lib/uring
lib/oniguruma
{% endblock %}

{% block configure %}
./configure RELEASE=y
{% endblock %}
