{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.18.3.tar.gz
df1b1e7cc3ea8922f6a287b5c2abb413
{% endblock %}

{% block bld_deps %}
lib/iconv/mix.sh
dev/lang/rustc/1/56/mix.sh
{{super()}}
{% endblock %}

{% block build %}
cargo build --release
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp target/release/bat ${out}/bin/
{% endblock %}
