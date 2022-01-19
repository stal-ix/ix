{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
bin/gcc/11(for_target={{for_target}},bin_prefix={{for_target}})
bin/binutils(for_target={{for_target}},bin_prefix={{for_target}})
{% endblock %}

{% block ind_deps %}
bin/gcc/env
{% endblock %}
