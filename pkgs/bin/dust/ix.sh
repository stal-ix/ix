{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
du-dust
{% endblock %}

{% block version %}
1.2.5
{% endblock %}

{% block cargo_url %}
https://github.com/bootandy/dust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
95ef36c3b63df7f74cfb183c2a671434870ea3ab63ade352ac53b8115eacc3f5
{% endblock %}

{% block cargo_bins %}
dust
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
