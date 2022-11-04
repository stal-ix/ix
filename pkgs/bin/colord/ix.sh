{% extends '//lib/colord/t/ix.sh' %}

{# hard dep on polkit #}

{% block meson_flags %}
{{super()}}
daemon=true
{% endblock %}
