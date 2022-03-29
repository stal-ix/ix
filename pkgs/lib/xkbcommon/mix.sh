{% extends '//lib/xkbcommon/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
enable-tools=false
{% endblock %}
