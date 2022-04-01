{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/bsdtar/lite(std_box=bld/bootbox,opt=fast)
{% endblock %}
