{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sway/bg
bin/sway/idle
bin/sway/tools
{% if sway_fx %}
bin/sway/fx
{% else %}
bin/sway/compositor(allocator=tcmalloc)
{% endif %}
{% endblock %}
