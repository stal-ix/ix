{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
du-dust
{% endblock %}

{% block version %}
1.2.7
{% endblock %}

{% block cargo_url %}
https://github.com/bootandy/dust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e19cbec91ef58363a177d441ad2845ea4667c0a86497ae737949557c8bc441e5
{% endblock %}

{% block cargo_bins %}
dust
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
