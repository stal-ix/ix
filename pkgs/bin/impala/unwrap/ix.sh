{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.2.3
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
af8b68f0de7a819013b3a3142b6132f368d2b558930e0c88e2300cd26f60e849
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/impala ${out}/bin/
{% endblock %}
