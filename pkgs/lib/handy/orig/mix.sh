{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/1.6.1/libhandy-1.6.1.tar.bz2
sha:c514ba3f953065b44b37e971dc179b47735db97af48fecb94b2a7d5148dffa35
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
introspection=disabled
glade_catalog=disabled
{% endblock %}

{% block c_rename_symbol %}
gtk_progress_tracker_advance_frame
gtk_progress_tracker_finish
gtk_progress_tracker_get_ease_out_cubic
gtk_progress_tracker_get_iteration
gtk_progress_tracker_get_iteration_cycle
gtk_progress_tracker_get_progress
gtk_progress_tracker_get_state
gtk_progress_tracker_init_copy
gtk_progress_tracker_skip_frame
gtk_progress_tracker_start
{% endblock %}

{% block install %}
{{super()}}
#exit 1
{% endblock %}
