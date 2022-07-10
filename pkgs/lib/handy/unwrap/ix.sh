{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/1.7.0/libhandy-1.7.0.tar.bz2
sha:c6f6bf81d6c36d69efa6ae8d3a5b1ef8cbb08fa69b81abc5ab44d5c66666d465
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
