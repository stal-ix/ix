{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/0.1.0.tar.gz
{% endblock %}

{% block cargo_sha %}
3d40ad2e6105efa530047d5e8a66bb518762bd7133b89d50c6937a2aab6771f2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/pf ${out}/bin/
{% endblock %}
