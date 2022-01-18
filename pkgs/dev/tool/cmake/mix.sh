{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/build/cmake(bld_deps=box/boot/0)
{% endblock %}
