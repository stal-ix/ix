{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v2.4.2.tar.gz
sha:877e1a39efaa062c996856d632d6aeedd409422be6c5bdb2064a9b707293c280
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/input
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
