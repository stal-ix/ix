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
146fc989731754be2fa3d65e00d0d44ec4a5ab255796d4449a89647c980e51c4
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/out/resvg ${out}/bin/
{% endblock %}
