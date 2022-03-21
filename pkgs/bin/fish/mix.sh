{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/fish-shell/fish-shell/archive/refs/tags/3.4.0.tar.gz
sha:a291e3eef57f30f30d9bbfd3dae25ad4f5c8313cfe78b4b4c4fc525cdd82f670
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/python
bin/gettext
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixit'
{% endblock %}
