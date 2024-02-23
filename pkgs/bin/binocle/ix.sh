{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sharkdp/binocle/archive/refs/tags/v0.3.2.tar.gz
{% endblock %}

{% block cargo_sha %}
a51d5bf0e63ee3c4d27255a8d30feae19acdd045b260e8e865d5fa4ade2578dd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/binocle ${out}/bin/
{% endblock %}
