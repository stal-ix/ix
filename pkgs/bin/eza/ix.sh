{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.0.tar.gz
{% endblock %}

{% block cargo_sha %}
10e604ce279bcf2ed05ec57aab317edb4a7482f4ba61a666319085d523167232
{% endblock %}

{% block cargo_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
