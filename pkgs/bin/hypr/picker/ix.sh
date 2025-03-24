{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v0.4.3.tar.gz
sha:bd6a4a0bb264905570a08cef2c4a37170df89bc64fdd0a359440b55f97e84a5b
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/hypr/utils
lib/xkb/common
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/hypr/wayland/scanner
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpicker ${out}/bin/
{% endblock %}
