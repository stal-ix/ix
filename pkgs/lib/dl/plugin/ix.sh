{% extends '//lib/dl/ix.sh' %}

{% block env %}
export PLUGINS="${out}/lib/reg.o:\${PLUGINS}"
{% endblock %}
