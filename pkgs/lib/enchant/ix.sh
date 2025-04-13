{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
enchant
{% endblock %}

{% block version %}
2.8.2
{% endblock %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v{{self.version().strip()}}/enchant-{{self.version().strip()}}.tar.gz
sha:8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block c_rename_symbol %}
rawmemchr
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=groff)
{% endblock %}

{% block configure_flags %}
--enable-relocatable
{% endblock %}
