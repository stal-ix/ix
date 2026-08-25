{% extends '//bin/perf/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bpf
lib/llvm
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/bpf/tool
bin/bpf/clang
bld/llvm/config
{% endblock %}

{% block make_flags %}
{{super()}}
BPFTOOL=${BPFTOOL}
CLANG_SYS_INCLUDES=${CLANG_HEADERS}
CLANG=bpf_clang
LIBBPF_INCLUDE=${BPF_HEADERS}
{% endblock %}
