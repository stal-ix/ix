{% extends '//lib/icu/t/ix.sh' %}

{% block install %}
{{super()}}
rm ${out}/bin/icu-config
{% endblock %}
