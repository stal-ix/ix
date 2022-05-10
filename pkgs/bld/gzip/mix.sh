{% extends '//bin/minigzip/mix.sh' %}

{% block run_deps %}
bin/minigzip/gzip(std_box=bld/boot/box)
{% endblock %}
