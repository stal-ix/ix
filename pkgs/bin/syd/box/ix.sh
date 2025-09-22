{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.38.3
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
8307d30ebeaca603b641582b08fe2280df951d5d37e637da839c24a23fbe2de6
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
