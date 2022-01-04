{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
dev/lang/gcc/11(for_target={{for_target}},bin_prefix={{for_target}})
dev/lang/binutils(for_target={{for_target}},bin_prefix={{for_target}})
{% endblock %}

{% block ind_deps %}
dev/lang/gcc/env
{% endblock %}
