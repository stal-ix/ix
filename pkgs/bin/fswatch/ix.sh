{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fswatch
{% endblock %}

{% block version %}
1.17.1
{% endblock %}

{% block fetch %}
https://github.com/emcrisostomo/fswatch/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:bd492b6e203b10b30857778f4dd26f688426cd352937bd7779ee245139bafa2b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
