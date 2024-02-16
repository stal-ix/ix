{% extends '//bin/dosbox/staging/ix.sh' %}

{% block meson_flags %}
{{super()}}
enable_debugger=heavy
{% endblock %}
