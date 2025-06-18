{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.35.1
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
92080fc4915e7e3c635dab7249a9872df7e55ced7060168ac06d09338edf376e
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/syd ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
