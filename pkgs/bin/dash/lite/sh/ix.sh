{% extends '//bin/dash/lite/ix.sh' %}

{% block install %}
{{super()}}
mv ${out}/bin/dash ${out}/bin/sh
{% endblock %}

