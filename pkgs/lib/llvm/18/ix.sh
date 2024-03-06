{% extends '//lib/llvm/16/ix.sh' %}

{% block bld_tool %}
{% block llvm_tblgen %}
{% if not native %}
lib/llvm/18/tblgen
{% endif %}
{% endblock %}
{{super()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}
