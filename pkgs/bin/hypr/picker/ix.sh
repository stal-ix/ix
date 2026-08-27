{% extends '//bin/hypr/t/ix.sh' %}

{% block pkg_name %}
hyprpicker
{% endblock %}

{% block version %}
0.4.7
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cde02b92abe372187c9d59a7cb2ca07ede5c3e1a8c81ed8b209dc0d3ac5f0339
https://github.com/hyprwm/hyprpicker/commit/d6115cad31aab3d537039a817b0590d83833d2a2.diff
ab9afa0317bbeacc6b4ff49f5a3ebf05d06b632ef5e9e72fa7823bb442578083
{% endblock %}

{% block patch %}
patch -p1 < ${src}/d6115cad31aab3d537039a817b0590d83833d2a2.diff
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
