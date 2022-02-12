{% extends '//bin/yash/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin; mv yash sh
{% endblock %}
