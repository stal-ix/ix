{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.57.0
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
3e1586fb8893ab37d16343ba8a1f6d93c527f0baeeec990f2ffbfc5c2567f5f6
{% endblock %}

{% block bld_libs %}
lib/seccomp
{% endblock %}

{% block cargo_bins %}
syd
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
