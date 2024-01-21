{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/bensadeh/tailspin/archive/refs/tags/3.0.0.tar.gz
{% endblock %}

{% block cargo_sha %}
37acaf24b5fe24c165aa0f26ceb3a121ead6cd4123cb4296bc1c2e8b65065bb9
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/tspin ${out}/bin/
{% endblock %}
