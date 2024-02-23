{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/cilium/pwru/archive/refs/tags/v1.0.5.tar.gz
{% endblock %}

{% block go_sha %}
7344fee35e9db3eefadc6ad4281547a502d126a84f25f1287b296556e1ff6473
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/llvm/17
{% endblock %}

{% block bld_tool %}
bin/ld
{% endblock %}

{% block build %}
set -xue
export XDG_CONFIG_HOME=${tmp}
export HOME=${tmp}
export CC=clang-17
export LD=ld
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
export TARGET_GOARCH=amd64
go env -w "CC=clang-17"
go generate
{{super()}}
{% endblock %}
