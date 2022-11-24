{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.7.tar.gz
sha:81ccccc045bfd7ee3f1909cc443158ea0d1833f77d6342fd19c33864a2ab71d1
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
