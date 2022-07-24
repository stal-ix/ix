{% extends '//bin/iwd/ix.sh' %}

{% block build_flags %}
compress
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/etc
rm ${out}/bin/iwmon
{% endblock %}
