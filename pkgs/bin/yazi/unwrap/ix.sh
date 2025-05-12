{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
25.4.8
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
507d358627510b1be0639bb68b028d3dd7c79b6f8e4c1b573b0f3ad59da8bbc6
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/yazi ${out}/bin/
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}

{% block rustc_ver %}
86
{% endblock %}
