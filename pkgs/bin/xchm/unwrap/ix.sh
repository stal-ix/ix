{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/1.35.tar.gz
sha:8d88b3c0cd69b0b6dad2c5fb0cfa1136e2e213e337ba548ef6312b4c8de9ef87
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
