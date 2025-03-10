{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/3.4.0.tar.gz
sha:7a45cd93b393eaa5804a7e490d58d0940b1c74bb24ecff2ae7b5c49e7a3c1198
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/cap
lib/hwloc
lib/curses
lib/unwind
{% endblock %}

{% block configure_flags %}
--enable-hwloc
--enable-unwind
--enable-cgroup
--enable-delayacct
--with-curses=ncursesw6
{% endblock %}
