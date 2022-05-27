{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if make_ver %}
bin/auto/make/{{make_ver}}
{% else %}
bin/auto/make/1/16/5(std_box=bld/boot/box)
{% endif %}
{% endblock %}
