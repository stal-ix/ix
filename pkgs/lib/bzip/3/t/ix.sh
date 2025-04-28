{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bzip3
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1664d27a1ad3fdfecade917a7c2f7597cad4dbea4b1c526d3eedd7583b920bef
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
