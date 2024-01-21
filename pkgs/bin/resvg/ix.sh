{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.38.0.tar.gz
{% endblock %}

{% block cargo_sha %}
0332056e6b0fbf4ca3a0e40a546b1de392475f6fb55beb366bb92878f55a61d8
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}
