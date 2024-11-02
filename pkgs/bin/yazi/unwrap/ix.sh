{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v0.3.3.tar.gz
{% endblock %}

{% block cargo_sha %}
beb7ca3912628aaa938552e176f313400144f32485678d4e2eebbeeebaad0947
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
