{% extends '//bin/grep/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz
sha:667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e
{% endblock %}

{% block bld_deps %}
bld/boot/5/sed
bld/boot/4/env
{% endblock %}
