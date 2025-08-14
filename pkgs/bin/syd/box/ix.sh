{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
sydbox
{% endblock %}

{% block version %}
3.37.7
{% endblock %}

{% block cargo_url %}
https://gitlab.exherbo.org/sydbox/sydbox/-/archive/v{{self.version().strip()}}/sydbox-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_sha %}
f7d32a9aebfc683095e94f5c75d95c08a2352dbc7ca869aabb5784dc8339428c
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
