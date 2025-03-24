{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v3.32.6/sydbox-v3.32.6.tar.bz2
{% endblock %}

{% block cargo_sha %}
e61ea2b16ef6c23ae1089cedc297258ea76fc9db827094847e71ab4fee3405e1
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/syd ${out}/bin/
{% endblock %}
