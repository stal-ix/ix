{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/1.6.2/libhandy-1.6.2.tar.bz2
sha:121a2a2689e4cc5d815131c021c8d71b9496780bac3c73cee747b63b51b3d732
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
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

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libhandy-1 \${CPPFLAGS}"
{% endblock %}
