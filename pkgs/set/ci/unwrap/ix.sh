{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/unwrap/wasi/32(target=wasi32)
set/ci/unwrap/linux/x86_64(target=linux-x86_64)
set/ci/unwrap/linux/aarch64(target=linux-aarch64)
set/ci/unwrap/linux/riscv64(target=linux-riscv64)
set/ci/unwrap/darwin/arm64(target=darwin-arm64)
set/ci/unwrap/darwin/x86_64(target=darwin-x86_64)
{% endblock %}
