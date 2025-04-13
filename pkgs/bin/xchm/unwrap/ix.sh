{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xCHM
{% endblock %}

{% block version %}
1.37
{% endblock %}

{% block fetch %}
https://github.com/rzvncj/xCHM/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:16d10b52bd98706c639866eebc30b904a963d10dc76ea7dc65fb20342e9f70a7
{% endblock %}

{%block bld_libs %}
lib/c
lib/chm
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
