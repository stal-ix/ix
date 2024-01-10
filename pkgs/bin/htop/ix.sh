{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/3.3.0.tar.gz
sha:1e5cc328eee2bd1acff89f860e3179ea24b85df3ac483433f92a29977b14b045
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
{% endblock %}
