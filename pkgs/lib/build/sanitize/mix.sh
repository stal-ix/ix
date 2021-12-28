{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if sanitize %}
lib/build/sanitize/{{sanitize}}
lib/compiler_rt/sanitizer(sanitize=)
{% endif %}
{% endblock %}
