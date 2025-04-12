{% extends '//die/rust/cargo.sh' %}

{% block version %}
3.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
89581650da222c69bb0746f94c820c696402f7680f09b812e9c2007504108212
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/tspin ${out}/bin/
{% endblock %}
