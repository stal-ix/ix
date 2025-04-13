{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zellij
{% endblock %}

{% block version %}
0.41.2
{% endblock %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2d053f573276a92f000308e59456a6bf3f121ef23099b060fb3471344cb559b0
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/zellij ${out}/bin/
{% endblock %}
