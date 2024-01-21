{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://git.sr.ht/~kennylevinsen/greetd/archive/0.9.0.tar.gz
{% endblock %}

{% block cargo_sha %}
2dc8a5e4e526a535a44c8e513aea2c62b09ca3e2c6eaf082238388288d7f7eaf
{% endblock %}

{% block bld_libs %}
lib/pam
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp target/release/greetd ${out}/bin/
cp target/release/agreety ${out}/bin/
{% endblock %}
