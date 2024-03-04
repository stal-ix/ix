{% extends '//bin/epiphany/t/ix.sh' %}

{% block bld_libs %}
lib/adwaita
lib/shim/xdg
lib/mesa/glesv2/dl
{{super()}}
{% endblock %}

{% block std_env %}
bld/wrapcc/link/dyn/new
{{super()}}
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block configure %}
export LDFLAGS="-rdynamic ${LDFLAGS}"
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*No available application.*|return ix_xdg_open(path);|' \
    -e 's|.*Failed to get default app for MIME type.*|return ix_xdg_open(uri);|' \
    -i lib/ephy-file-helpers.c
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
adw_widget_compute_expand
adw_widget_compute_expand_horizontal_only
adw_widget_focus_child
adw_widget_get_request_mode
adw_widget_grab_focus_child
adw_widget_grab_focus_self
adw_widget_lookup_color
{% endblock %}
