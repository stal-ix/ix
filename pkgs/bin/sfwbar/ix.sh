{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/LBCrion/sfwbar/archive/refs/tags/v1.0_beta6.tar.gz
sha:4967c4565cf231e7701c74dba0aa5ae14df443acf3c551f961f9b6f12b94abde
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/json/c
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('sfwbar')}}
{% endblock %}
