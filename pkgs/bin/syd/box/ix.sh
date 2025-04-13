{% extends '//die/rust/cargo.sh' %}

{% block version %}
3.32.7
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
b2ae323da876bf268545d0ae105d47ddf6b1a23989d06146224024fea3a026d5
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/syd ${out}/bin/
{% endblock %}
