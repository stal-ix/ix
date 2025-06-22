{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
enchant
{% endblock %}

{% block version %}
2.8.10
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/enchant/releases/download/v{{self.version().strip()}}/enchant-{{self.version().strip()}}.tar.gz
6db791265ace652c63a6d24f376f4c562b742284d70d3ccb9e1ce8be45b288c9
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

{% block install %}
mkdir -p ${out}/lib/enchant-2
{{super()}}
{% endblock %}
