{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/fx/unwrap(allocator={{default_allocator}},wlroots_ver=20,sway_wlroots_opengl=1)
{% endblock %}
