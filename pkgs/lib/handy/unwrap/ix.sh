{% extends '//lib/handy/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=disabled
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
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

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/libhandy-1 \${CPPFLAGS}"
{% endblock %}
