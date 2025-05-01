{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpicker
{% endblock %}

{% block version %}
0.4.5
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fe9611ec78524f9bbea0d39308da3d9c61cb20f6103179a269cad8013bb0c1f3
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
