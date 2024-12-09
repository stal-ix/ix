{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
# intent to never free memory
bin/heirloom/ed(purec=tiny,libc=tiny,bumpalloc_buf=1000000)
{% else %}
bin/heirloom/ed
{% endif %}
{% endblock %}
