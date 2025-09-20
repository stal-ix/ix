{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if initrd %}
bin/kernel/initrd
{% endif %}
bin/kernel/gengrub
{% endblock %}
