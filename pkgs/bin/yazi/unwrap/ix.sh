{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
0.4.1
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b9047ffe58dc14f9158e2b273b32839589d67582bfc179958ab8159331da1d8b
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
