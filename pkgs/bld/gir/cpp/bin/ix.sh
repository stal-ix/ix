{% extends '//bin/cppgir/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/bin/cppgir ${out}/bin/cppgir-bin
{% endblock %}
