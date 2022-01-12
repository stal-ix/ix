{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/1.5.0/libhandy-1.5.0.tar.bz2
sha:ca2e6fe95c214590f48b64db88d72526cefa23f67aacf5ebdc63dfbd25bff92b
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
lib/glib
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
