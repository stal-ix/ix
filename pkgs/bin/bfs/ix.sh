{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bfs
{% endblock %}

{% block version %}
4.0.7
{% endblock %}

{% block fetch %}
https://github.com/tavianator/bfs/archive/refs/tags/{{self.version().strip()}}.tar.gz
37b11768b9b9bb50c7016d261317a4cd1ce047751681cfad528ccd700a65cd9e
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
