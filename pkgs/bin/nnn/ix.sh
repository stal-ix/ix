{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.9.tar.gz
sha:9e25465a856d3ba626d6163046669c0d4010d520f2fb848b0d611e1ec6af1b22
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
