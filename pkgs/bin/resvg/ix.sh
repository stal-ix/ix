{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
resvg
{% endblock %}

{% block version %}
0.45.1
{% endblock %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
fda07eac7d2115a89caf7557718c2818466c3ab60a3c77533fc2c614f7bed5cb
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/out/resvg ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
