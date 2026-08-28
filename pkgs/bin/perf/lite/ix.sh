{% extends '//bin/perf/t/ix.sh' %}

# perf without BPF and LLVM support: no lib/llvm, lib/bpf, bpftool in the
# dependency closure. Slower source file resolution, no BPF skeletons.

{% block make_flags %}
{{super()}}
NO_LIBBPF=1
BUILD_BPF_SKEL=0
NO_LIBLLVM=1
{% endblock %}
