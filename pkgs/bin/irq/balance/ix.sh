{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Irqbalance/irqbalance/archive/refs/tags/v1.9.4.tar.gz
sha:f37bb2e27c2e9ec609131d0ee3f770185d3845f79ee6ef11477ea0ffb600a561
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
