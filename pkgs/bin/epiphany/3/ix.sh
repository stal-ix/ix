{% extends '//bin/epiphany/t/ix.sh' %}

{% block bld_libs %}
lib/handy
lib/dazzle
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}

(find . -name '*.c' | while read l; do
    cat ${l}
done) | grep '_class_init' \
      | sed -e 's|_class_init.*|_get_type|' \
      | sort | uniq \
      | grep -v ephy_search_provider_get_type \
      | grep -v ephy_web_overview_model_get_type \
      | grep -v ephy_web_process_extension_get_type \
      | grep -v ephy_add_search_engine_row_item_get_type \
      | grep -v ephy_web_app_provider_service_get_type \
      | grep -v ephy_web_extension_extension_get_type \
      > types

cat << EOF >> types
adguard_get_resource
readability_get_resource
highlightjs_get_resource
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
    echo 'void gobject_init();'

    cat types | while read l; do
        echo "GType ${l}(void);"
    done

    cat << EOF
__attribute__((constructor))
static void premain_init_types() {
    gobject_init();
EOF

    cat types | while read l; do
        echo "${l}();"
    done

    echo '}'
) >> src/ephy-main.c
{% endblock %}
