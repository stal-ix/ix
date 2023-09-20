{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/1.36.tar.gz
sha:039a2a726d122ff68a12d3e5a843b051b4a92b033cf0b7f8a5b87493773b287e
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
