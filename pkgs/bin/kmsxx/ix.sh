{% extends '//lib/kmsxx/ix.sh' %}

{% block meson_flags %}
{{super()}}
# hard x11 dep
#kmscube=true
{% endblock %}
