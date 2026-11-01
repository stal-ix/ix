{% extends '//bin/clang/22/ix.sh' %}

{% block llvm_targets %}
clang-format
{% endblock %}

{% block clang_fix_includes %}
{% endblock %}

{% block env %}
{% endblock %}
