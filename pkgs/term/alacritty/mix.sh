{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/alacritty/alacritty/archive/refs/tags/v0.9.0.tar.gz
393d34a29db21390964181b73cf9cba1
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
mkdir ${out}/bin && cp target/release/alacritty ${out}/bin/
{% endblock %}
