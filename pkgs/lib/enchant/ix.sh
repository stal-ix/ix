{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
enchant
{% endblock %}

{% block version %}
2.8.15
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/enchant/releases/download/v{{self.version().strip()}}/enchant-{{self.version().strip()}}.tar.gz
d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252
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
