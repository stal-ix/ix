{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/binocle/archive/refs/tags/v0.3.2.tar.gz
{% endblock %}

{% block cargo_sha %}
ccaa0f0164d95118e0d317bdac4e9755a78ebcc29388e55e3dca7baf32eef402
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/binocle ${out}/bin/
{% endblock %}
