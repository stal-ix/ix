{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/3.2.0.tar.gz
sha:1a1dd174cc828521fe5fd0e052cff8c30aa50809cf80d3ce3a481c37d476ac54
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/cap
lib/curses
{% endblock %}

{% block configure_flags %}
--enable-cgroup
--enable-delayacct
{% endblock %}
