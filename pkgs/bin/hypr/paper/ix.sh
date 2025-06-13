{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpaper
{% endblock %}

{% block version %}
0.7.5
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v{{self.version().strip()}}.tar.gz
93efc089c7051e6727ac5eac402ebd254199e93ac3efd6fe7dd37a52ddc1cc33
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
