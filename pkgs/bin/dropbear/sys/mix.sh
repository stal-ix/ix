{% extends '//bin/dropbear/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin; rm dropbearconvert dropbearkey
{% endblock %}
