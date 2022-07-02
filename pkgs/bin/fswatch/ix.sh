{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/emcrisostomo/fswatch/archive/refs/tags/1.17.1.tar.gz
sha:bd492b6e203b10b30857778f4dd26f688426cd352937bd7779ee245139bafa2b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
