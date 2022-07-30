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

{% set clang_export_ver %}
{% block clang_export_ver %}
14.0.0
{% endblock %}
{% endset %}

{% block env %}
{{super()}}
export CLANG_VERSION={{clang_export_ver.strip()}}
{% endblock %}
