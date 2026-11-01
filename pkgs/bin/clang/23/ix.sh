{% extends '//bin/clang/20/ix.sh' %}

{% block clang_major_version %}
23
{% endblock %}

{% block fetch %}
{% include '//lib/llvm/23/ver.sh' %}
{% endblock %}

{# multicall=1: one `llvm` binary (LLVM_TOOL_LLVM_DRIVER_BUILD), every other
   tool name is a symlink to it. Only the tools that register with the driver
   (GENERATE_DRIVER) exist in this mode; install-llvm-driver installs the
   binary and its symlinks. #}
{% block llvm_targets %}
{% if multicall %}
llvm-driver
clang-resource-headers
{% else %}
{{super()}}
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
{% if multicall %}
LLVM_TOOL_LLVM_DRIVER_BUILD=ON
{% endif %}
{% endblock %}

{# The driver build does not version the clang name; FREESTANDING_CLANG is
   clang-<major>, so give it the same symlink a standalone build installs. #}
{% block install %}
{{super()}}
{% if multicall %}
ln -s llvm ${out}/bin/clang-{{self.clang_export_ver().strip()}}
{% endif %}
{% endblock %}

{# musl sizes thread stacks from PT_GNU_STACK p_memsz (capped at 8 MiB); the
   128 KiB default is too small for clang and lld. lib/llvm/t overrides
   setup_target_flags without super(), so ld_flags does not reach here. #}
{% block setup_target_flags %}
{{super()}}
{% if linux %}
export LDFLAGS="-Wl,-z,stack-size=8388608 ${LDFLAGS}"
{% endif %}
{% endblock %}
