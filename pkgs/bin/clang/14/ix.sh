{% extends '//bin/clang/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/14/ver.sh' %}
{% endblock %}

{% block bld_libs %}
{{super()}}
{% if linux %}
lib/execinfo
{% endif %}
{% endblock %}

{% block std_box %}
bld/python
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export CLANG_VERSION=14.0.0
{% endblock %}
