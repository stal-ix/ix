{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unbound
{% endblock %}

{% block version %}
1.23.1
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
bf508ce976e03c0fc90e6b2f245708a36858ed31293fc438bb6f1d130cd1895c
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
