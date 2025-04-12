{% extends '//die/rust/cargo.sh' %}

{% block version %}
1.40.0
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
61ead841da33cd639f995ab8ddc47294801c21823fb3ee43cb61d5ce1f4b766e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/just ${out}/bin/
{% endblock %}
