{% extends '//mix/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.4.9/zathura-0.4.9.tar.bz2
sha:b4405dc490d2fd13e0348b977d535752be0dee682450459d9693f36ea50f02ce
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
bin/glib/codegen
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
