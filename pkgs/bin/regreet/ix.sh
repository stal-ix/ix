{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/rharish101/ReGreet/archive/9ff3e11bb1b66b52f6e44a9b6c0fe93a8c993f74.zip
{% endblock %}

{% block cargo_sha %}
abe0f8ed8bba9bd32a639b268eea98cca1317b001a1f8f623fa1e068f3a88a82
{% endblock %}

{% block bld_libs %}
lib/gtk/4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/regreet ${out}/bin/
{% endblock %}
