{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.11.tar.gz
{% endblock %}

{% block cargo_sha %}
b903a740e517159c1fd33db71b4cdb193c62111e67672b9c2de6b4041ce00600
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
