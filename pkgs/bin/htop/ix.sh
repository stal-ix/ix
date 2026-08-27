{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
htop
{% endblock %}

{% block version %}
3.5.3
{% endblock %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/{{self.version().strip()}}.tar.gz
edf25ee020a5263ffbef9eef5a8c14392bf74e78b3d5c8bc64d9343dd9a82605
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
