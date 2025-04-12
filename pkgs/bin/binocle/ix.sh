{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.3.2
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/binocle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
dfeeada61a338cd39d7c3c35b9a1559a1f90d3605286699eaf4cde0cd4b44813
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/binocle ${out}/bin/
{% endblock %}
