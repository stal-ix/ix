{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
yash
{% endblock %}

{% block version %}
2.61
{% endblock %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/{{self.version().strip()}}/yash-{{self.version().strip()}}.tar.xz
a214966f4ff8b293aa5521a4d3ef6e87d707579eee616aa2f8218edaa920d447
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block bld_tool1 %}
bld/gettext
{% endblock %}
