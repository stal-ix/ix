{% extends '//lib/input/t/ix.sh' %}

{% block env %}
export INPUT_DATA="${out}"
{% endblock %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/aux
{% endblock %}
