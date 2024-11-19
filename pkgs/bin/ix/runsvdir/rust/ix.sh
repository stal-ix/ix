{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/maratik123/runsvdir/archive/0cbddbc386a66f9bbec1be0e1277d6ad85224eb2.zip
{% endblock %}

{% block cargo_sha %}
678e041588a3c6dfa6385a74463530ac3efe7ffb1595c8fea1fa4ab078f01bcb
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/runsvdir ${out}/bin/
{% endblock %}
