{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/gcc/12(bin_prefix={{for_target}})
bin/binutils(bin_prefix={{for_target}})
{% endblock %}

{% block ind_deps %}
bin/gcc/env
{% endblock %}
