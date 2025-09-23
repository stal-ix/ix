{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
yash
{% endblock %}

{% block version %}
2.60
{% endblock %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/{{self.version().strip()}}/yash-{{self.version().strip()}}.tar.xz
cc152f65221916c508e3ec013edda40028d1f77a9ca3dcf2489ee825fd746f75
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block bld_tool1 %}
bld/gettext
{% endblock %}
