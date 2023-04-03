{% extends '//bin/clang/16/ix.sh' %}

{% block llvm_targets %}
lld
{% endblock %}

{% block clang_fix_includes %}
{% endblock %}

{% block env %}
{% endblock %}
