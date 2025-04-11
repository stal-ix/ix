{% extends '//bin/clang/18/ix.sh' %}

{% block llvm_projects %}
{{super()}}
clang-tools-extra
{% endblock %}

{% block llvm_targets %}
clangd
clang-resource-headers
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block clang_fix_includes %}
{% endblock %}
