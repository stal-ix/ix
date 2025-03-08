{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://git.sr.ht/~whynothugo/shotman/archive/99baca7747e6d48801f91b58bc392b7df46dc56b.tar.gz
{% endblock %}

{% block cargo_sha %}
8b4619a1da74b843d3bb868faa8f972898cf7bd6591024aac3b7f717bc5f5b47
{% endblock %}

{% block bld_libs %}
lib/xkb/common
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/shotman ${out}/bin/
{% endblock %}
