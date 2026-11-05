{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bfs
{% endblock %}

{% block version %}
4.1.6
{% endblock %}

{% block fetch %}
https://github.com/tavianator/bfs/archive/refs/tags/{{self.version().strip()}}.tar.gz
5b706e1b362c1f05093e1436b396fc8129c6e456a112b9e4a06fd7916f19baaf
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/cap
lib/uring
lib/oniguruma
{% endblock %}

{% block configure %}
./configure --enable-release --prefix=${out}
{% endblock %}
