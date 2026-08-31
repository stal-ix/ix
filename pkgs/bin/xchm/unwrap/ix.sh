{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xCHM
{% endblock %}

{% block version %}
1.39
{% endblock %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/{{self.version().strip()}}.tar.gz
e806a6daa6db115406f75f6c1e969734db62dd000b39bb7d55e0ba4c1a88ec16
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
