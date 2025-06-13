{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
htop
{% endblock %}

{% block version %}
3.4.1
{% endblock %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/{{self.version().strip()}}.tar.gz
af9ec878f831b7c27d33e775c668ec79d569aa781861c995a0fbadc1bdb666cf
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
