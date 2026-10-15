{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hunspell
{% endblock %}

{% block version %}
1.7.4
{% endblock %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
57bd9927cd1ee691cb96b244b7532dd941edeab126482e23b970a6335e95f287
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
