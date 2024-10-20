{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/bpftrace/bpftrace/archive/refs/tags/v0.21.2.tar.gz
sha:7c2cb089da6e6074574edc164cf9242e06843e66c493304a9d2739258e6a1459
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/bpf
lib/pcap
lib/zstd
lib/kernel
lib/elfutils
{% endblock %}
