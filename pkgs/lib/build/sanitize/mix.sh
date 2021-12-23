{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if sanitize %}
lib/build/sanitize/{{sanitize}}/mix.sh
lib/compiler_rt/sanitizer/mix.sh(sanitize=)
{% endif %}
{% endblock %}
