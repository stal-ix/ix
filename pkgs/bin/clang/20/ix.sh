{% extends '//bin/clang/17/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/blake3/c
{% endblock %}

{% block clang_major_version %}
20
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/20/ver.sh' %}
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

{% block clang_fix_includes %}
mkdir -p ${out}/share
mv ${out}/lib/clang/2*/include ${out}/share/
rm -rf ${out}/libexec
{% endblock %}
