{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/3.2.2.tar.gz
sha:3829c742a835a0426db41bb039d1b976420c21ec65e93b35cd9bfd2d57f44ac8
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
