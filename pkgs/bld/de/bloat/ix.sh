{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/pax/utils(libc_lite=1)
bld/de/bloat/scripts
{% endblock %}
