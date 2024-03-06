{% extends '//bin/clang/17/ix.sh' %}

{% block clang_major_version %}
18
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/18/ver.sh' %}
{% endblock %}

{% block clang_export_ver %}
{{self.clang_major_version().strip()}}.1.0
{% endblock %}

{% block bld_tool %}
{% if not native %}
lib/llvm/{{self.clang_major_version().strip()}}/tblgen
{% endif %}
{{super()}}
{% endblock %}
