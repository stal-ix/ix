{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v3.32.3/sydbox-v3.32.3.tar.bz2
{% endblock %}

{% block cargo_sha %}
2ecb9ff09250684fc50f41981483833e5200aec33d3f801c087e472893590aed
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/syd ${out}/bin/
{% endblock %}
