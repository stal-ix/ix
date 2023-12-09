{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura/-/archive/0.5.3/zathura-0.5.3.tar.bz2
sha:194982528fbac747d94dfef1e7c729b2b81b46c6fa1d2e706f3d1caf3c81898f
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
bld/glib
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
