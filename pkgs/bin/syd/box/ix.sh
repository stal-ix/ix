{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.36.0
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
c0b4440ffbcd962b8bba9e3b7879460031ac8d7c04d0bab12657966deccbdcbd
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
