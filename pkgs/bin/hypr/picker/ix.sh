{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v0.4.2.tar.gz
sha:60c1472357be2653f9413016b277276456cfe670b79039aaa10860df3023d9c6
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
