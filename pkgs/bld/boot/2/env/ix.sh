{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if darwin %}
bld/boot/2/xcrun
{% endif %}
bld/boot/2/wak
bld/boot/2/minised
bld/boot/2/sbase
bld/boot/2/make
bld/boot/0/env
{% endblock %}
