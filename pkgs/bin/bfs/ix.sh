{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bfs
{% endblock %}

{% block version %}
4.1.4
{% endblock %}

{% block fetch %}
https://github.com/tavianator/bfs/archive/refs/tags/{{self.version().strip()}}.tar.gz
0cac6849efb8a9447268fb273de3fab38f8460adb26a1770934e3f325fab8f5d
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
