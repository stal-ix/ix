{% extends '//bin/yash/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin; ln -s yash sh
{% endblock %}
