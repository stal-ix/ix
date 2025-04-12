{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
grep
{% endblock %}

{% block version %}
3.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-{{self.version().strip()}}.tar.xz
sha:667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e
{% endblock %}

{% block bld_deps %}
bld/boot/6/sed
bld/boot/5/env
{% endblock %}
