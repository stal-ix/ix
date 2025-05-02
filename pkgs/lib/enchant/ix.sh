{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
enchant
{% endblock %}

{% block version %}
2.8.4
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/enchant/releases/download/v{{self.version().strip()}}/enchant-{{self.version().strip()}}.tar.gz
sha:e28f98208df5f99320d6a05cd49f83420bf71e69052debe3b343c9bb15c833ed
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
