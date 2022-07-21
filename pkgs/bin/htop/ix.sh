{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/htop-dev/htop/archive/refs/tags/3.2.1.tar.gz
sha:b5ffac1949a8daaabcffa659c0964360b5008782aae4dfa7702d2323cfb4f438
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
