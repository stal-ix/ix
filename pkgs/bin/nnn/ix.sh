{% extends '//die/c/make.sh' %}

{% block pkg_name %}
nnn
{% endblock %}

{% block version %}
5.3
{% endblock %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
79ee69f3ced7c0778d207df76b4d4d680636975ccda002eeb19d0917fcba3d36
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
