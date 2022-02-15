{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/clang/14(std_env=boot/8/env/cxx,opt=fast,cplpl_std=14)
{% endblock %}
