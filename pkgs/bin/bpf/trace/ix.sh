{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
bpftrace
{% endblock %}

{% block version %}
0.23.0
{% endblock %}

{% block fetch %}
https://github.com/bpftrace/bpftrace/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bc9cbccdfdb7450edffad00db248f89b7036ac9944b566638df0b5685f2fda67
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/bcc
lib/bpf
lib/bfd
lib/pcap
lib/zstd
lib/cereal
lib/kernel
lib/iberty
lib/opcodes
lib/elfutils
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/llvm/config
{% endblock %}
