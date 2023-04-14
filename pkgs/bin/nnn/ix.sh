{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.8.tar.gz
sha:0a744e67a0ce8b5e1e04961f542d2c33ddb6ceed46ba760dd35c4922b21f1146
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
