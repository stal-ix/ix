{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.6.tar.gz
sha:15acaf9a88cfb5a2a640d3ef55a48af644fba92b46aac0768efe94c4addf7e3f
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
