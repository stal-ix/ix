{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/lang/clang/mix.sh(opt=O2;ICF;LTO)
{% endblock %}
