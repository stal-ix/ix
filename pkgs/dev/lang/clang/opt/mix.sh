{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/lang/clang/mix.sh(std_env=boot/8/env/cxx/mix.sh,opt=O2;ICF;LTO)
{% endblock %}
