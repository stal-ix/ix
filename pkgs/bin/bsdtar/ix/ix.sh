{% extends '//lib/archive/lite/ix.sh' %}

{% block build_flags %}
compress
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/bsdcat
rm ${out}/bin/bsdcpio
{% endblock %}
