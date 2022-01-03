{% extends '//mix/template/hub.sh' %}

{% set t %}{{target.gnu.three}}{% endset %}
{% set f %}{{for_target}}{% endset %}

{% block run_deps %}
dev/lang/gcc/11(for_target={{t}},bin_prefix={{t}})
dev/lang/binutils(for_target={{t}},bin_prefix={{t}})

dev/lang/gcc/11(for_target={{f}},bin_prefix={{f}})
dev/lang/binutils(for_target={{f}},bin_prefix={{f}})
{% endblock %}

{% block ind_deps %}
dev/lang/gcc/env
{% endblock %}
