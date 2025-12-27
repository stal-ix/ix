{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
irqbalance
{% endblock %}

{% block version %}
1.9.5
{% endblock %}

{% block fetch %}
https://github.com/Irqbalance/irqbalance/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c5fc3b1880136437d297afe9a7833781e7849939e104d0780888ffcafc37e339
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/glib
lib/numa
lib/cap/ng
lib/curses
lib/kernel
{% endblock %}
