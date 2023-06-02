{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.5.0/enchant-2.5.0.tar.gz
sha:149e224cdd2ca825d874639578b6246e07f37d5b8f3970658a377a1ef46f2e15
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

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
