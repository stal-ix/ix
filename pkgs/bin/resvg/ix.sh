{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.44.0
{% endblock %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
9d59e16d9eff774b115d5af411fdab57e46ec21542a6ed949f46aa23438fbc7d
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/out/resvg ${out}/bin/
{% endblock %}
