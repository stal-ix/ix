{% extends '//lib/wlroots/17/ix.sh' %}

{% block version %}
0.18.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/{{self.version().strip()}}/wlroots-{{self.version().strip()}}.tar.bz2
sha:a28061f7778f28f7be377fd4d6f0ebd58cb2a63b52460e9fde28e2ab43e80cab
{% endblock %}
