{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpicker
{% endblock %}

{% block version %}
0.4.8
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b3c1714d25bed3a1d59b813a7c59156a7c55f1f1cf2bea2306ba6b01cf8d49a7
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
