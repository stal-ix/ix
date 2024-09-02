{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/0.1.0.tar.gz
{% endblock %}

{% block cargo_sha %}
0ec8fc53234edd8ac6b575d35e66fddffb383af72b61555297019cdc4cd668d1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/pf ${out}/bin/
{% endblock %}
