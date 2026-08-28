{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpaper
{% endblock %}

{% block version %}
0.8.4
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4912c7aede303918f38a3fc6b294429e2d541b639ebba67bcab58d1d367ea360
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
