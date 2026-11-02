{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpaper
{% endblock %}

{% block version %}
0.8.5
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d5868931dc485fd2e798717ce885bc62abd1e00796ff921f31e1903147bff3bf
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/webp
lib/hypr/lang
lib/hypr/wire
lib/hypr/graphics
lib/hypr/toolkit
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/hypr/wayland/scanner
lib/hypr/wire
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
