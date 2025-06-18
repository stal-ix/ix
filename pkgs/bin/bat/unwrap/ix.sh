{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bat
{% endblock %}

{% block version %}
0.25.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/bat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ed475f95553546a342f4a139f5067f08499807466e4862b380dee35ad99336e9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/iconv
lib/git/2
lib/oniguruma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bat ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
