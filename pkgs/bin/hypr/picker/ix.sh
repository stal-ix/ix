{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v0.4.1.tar.gz
sha:e14d881f9645fd633b29370875ec4e98e24ad3455c522f7bcd68c3d17eda338a
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
