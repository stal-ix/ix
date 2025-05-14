{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
yash
{% endblock %}

{% block version %}
2.59
{% endblock %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/{{self.version().strip()}}/yash-{{self.version().strip()}}.tar.xz
sha:299a50ea70f23dcbb94cf278f3e99e788b20b613185a0426ed5fdd189b1711ee
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block bld_tool1 %}
bld/gettext
{% endblock %}
