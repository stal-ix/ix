{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpaper
{% endblock %}

{% block version %}
0.7.6
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a19f59e21abb8b1e3f4103ffeeac7c4658c1c09433047979836b2210a4edc40e
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/webp
lib/hypr/lang
lib/hypr/graphics
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/hypr/wayland/scanner
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
