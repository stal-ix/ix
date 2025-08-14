{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bzip3
{% endblock %}

{% block version %}
1.5.3
{% endblock %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/{{self.version().strip()}}.tar.gz
21eb292f70866d23ffa12fc3e4fae3fd5bb9a1341c01410dc6bbc5dd62cf2040
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
