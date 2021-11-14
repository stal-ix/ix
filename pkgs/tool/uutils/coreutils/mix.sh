{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.8.tar.gz
a45b94c5106f5985a05fef42dac1dc98
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
lib/iconv/mix.sh
dev/lang/rustc/1/56/mix.sh
{{super()}}
{% endblock %}

{% block setup %}
export CARGO_BUILD_JOBS=${make_thrs}
export CARGO_INSTALL_ROOT=${out}
export CARGO_HOME=${tmp}/obj
{% endblock %}

{% block build %}
cargo build --release --features macos
{% endblock %}

{% block install %}
cargo install --path .
{% endblock %}
