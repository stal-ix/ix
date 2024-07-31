{% extends '//lib/gtk/source/view/4/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
gir=false
vapi=false
{% endblock %}

{% block env %}
export SOURCE_VIEW_DATA="${out}"
{% endblock %}
