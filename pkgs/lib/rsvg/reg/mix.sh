{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/rsvg/plugin
{% endblock %}

{% block export_symbols_sh %}
llvm-nm ${lib_rsvg_plugin}/lib/librsvgplugin.a | grep svg_
{% endblock %}

{% block export_lib %}
rsvg_plugin
{% endblock %}
