{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/lang/clang/13(std_env=boot/8/env/cxx,opt=O2;ICF;LTO,cplpl_std=14)
{% endblock %}
