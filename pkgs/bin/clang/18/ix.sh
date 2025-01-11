{% extends '//bin/clang/17/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/blake3/c
{% endblock %}

{% block clang_major_version %}
18
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/18/ver.sh' %}
{% endblock %}

{% block clang_export_ver %}
{{self.clang_major_version().strip()}}
{% endblock %}

{% block bld_tool %}
{% if not native %}
lib/llvm/{{self.clang_major_version().strip()}}/tblgen
{% endif %}
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
base64 -d << EOF | patch clang/lib/Sema/TreeTransform.h
{% include '0.diff/base64' %}
EOF
{% endblock %}
