{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.5.1/zathura-0.5.1.tar.bz2
sha:b6e54647ab634cb8e79a8abdad36fcce40151a887d3e84ec8030fa1700f18a21
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/cairo
lib/girara
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
