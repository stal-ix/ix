{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.40.0
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
4053482da0a4588ca77ed8495d365d6f0b52d43263a76190cd0dd674b1308c41
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block cargo_bins %}
syd
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
