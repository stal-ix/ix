{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bfs
{% endblock %}

{% block version %}
4.1
{% endblock %}

{% block fetch %}
https://github.com/tavianator/bfs/archive/refs/tags/{{self.version().strip()}}.tar.gz
7a2ccafc87803b6c42009019e0786cb1307f492c2d61d2fcb0be5dcfdd0049da
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
