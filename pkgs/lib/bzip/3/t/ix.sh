{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1116c5984c87c2193f3981b53669c8cbb4ffd1b158de880be3c5ff27a35db400
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
