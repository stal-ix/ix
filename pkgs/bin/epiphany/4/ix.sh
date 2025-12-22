{% extends '//bin/epiphany/t/ix.sh' %}

{% block bld_libs %}
lib/adwaita
lib/shim/xdg
lib/drivers/3d
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
gvdb_table_free
gvdb_table_get_names
gvdb_table_get_raw_value
gvdb_table_get_table
gvdb_table_get_value
gvdb_table_has_value
gvdb_table_is_valid
gvdb_table_list
gvdb_table_new
gvdb_table_new_from_bytes
{% endblock %}

{% block undef %}
_ZN4SkSL9Transform26EliminateUnnecessaryBracesERKNS_7ContextERNS_6ModuleE
_ZN4SkSL9Transform29ReplaceSplatCastsWithSwizzlesERKNS_7ContextERNS_6ModuleE
_ZN6skjson3DOMC1EPKcm
_ZN6skjson9NullValueC1Ev
_ZNK6skjson11ObjectValue4findEPKc
{% endblock %}

{% block ld_flags %}
{{super()}}
-Wl,--no-demangle
{% for x in self.undef() | parse_list %}
-Wl,--defsym={{x}}=abort
{% endfor %}
{% endblock %}
