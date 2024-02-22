{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.40.0.tar.gz
{% endblock %}

{% block cargo_sha %}
9690a24b27c686dee0625de98a4d8fbc5addcca12f34ad5e4c225a3f7d833464
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}
