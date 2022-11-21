{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/1.33.tar.gz
sha:8537563bc790dc2f9b27e0355d8a7e538c01347dcfd8bd392ac78ad3eeb69701
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
