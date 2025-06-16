{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if sanitize %}
{% if not linux %}
{{ix.error('Building with sanitizers is currently only supported on Linux')}}
{% endif %}
lib/build/sanitize/{{sanitize}}
lib/compiler_rt/sanitize/{{sanitize}}(sanitize=)
{% endif %}
{% endblock %}
