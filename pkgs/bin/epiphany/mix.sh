{% extends '//mix/gnome.sh' %}

{% block fetch %}
https://download.gnome.org/sources/epiphany/42/epiphany-42.0.tar.xz
sha:3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3
{% endblock %}

{% block bld_libs %}
bin/epiphany/libs(gtk_ver=3)
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block run_data %}
aux/iso-codes
{% endblock %}

{% block run_deps %}
bin/webkitproc
{% endblock %}

{% block meson_flags %}
libportal=disabled
unit_tests=disabled
soup2=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build

(find . -name '*.c' | while read l; do
    cat ${l}
done) | grep '_class_init' \
      | sed -e 's|_class_init.*|_get_type|' \
      | sort | uniq \
      | grep -v ephy_search_provider_get_type \
      | grep -v ephy_web_overview_model_get_type \
      | grep -v ephy_web_process_extension_get_type \
      | grep -v ephy_add_search_engine_row_item_get_type \
      > types

cat << EOF >> types
adguard_get_resource
readability_get_resource
highlightjs_get_resource
pdfjs_get_resource
epiphany_get_resource
ephy_bookmark_properties_type_get_type
ephy_download_action_type_get_type
ephy_embed_shell_mode_get_type
ephy_history_page_visit_type_get_type
ephy_history_sort_type_get_type
ephy_history_url_property_get_type
ephy_link_flags_get_type
ephy_new_tab_flags_get_type
ephy_prefs_reader_color_scheme_get_type
ephy_prefs_reader_font_style_get_type
ephy_prefs_restore_session_policy_get_type
ephy_prefs_ui_tabs_bar_visibility_policy_get_type
ephy_prefs_web_hardware_acceleration_policy_get_type
ephy_security_level_get_type
ephy_sq_lite_connection_mode_get_type
ephy_startup_mode_get_type
ephy_web_view_document_type_get_type
ephy_web_view_error_page_get_type
ephy_web_view_navigation_flags_get_type
ephy_window_chrome_get_type
EOF

(
    echo 'void g_object_init();'

    cat types | while read l; do
        echo "GType ${l}(void);"
    done

    cat << EOF
__attribute__((constructor))
static void premain_init_types() {
    g_object_init();
EOF

    cat types | while read l; do
        echo "${l}();"
    done

    echo '}'
) >> src/ephy-main.c
{% endblock %}

{% block install %}
{{super()}}

{% call hooks.wrap_xdg_binary('epiphany') %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endcall %}

rm -r ${out}/bin/bin_*
{% endblock %}
