{% extends '//mix/hub.sh' %}

{% block run_deps %}
bld/bsdtar(std_box=bld/bootbox,opt=fast)
{% endblock %}
