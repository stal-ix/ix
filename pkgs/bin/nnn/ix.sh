{% extends '//die/c/make.sh' %}

{% block pkg_name %}
nnn
{% endblock %}

{% block version %}
5.0
{% endblock %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:31e8fd85f3dd7ab2bf0525c3c0926269a1e6d35a5343a6714315642370d8605a
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/fts
{% endif %}
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
