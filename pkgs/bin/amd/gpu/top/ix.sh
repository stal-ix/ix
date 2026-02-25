{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
amdgpu_top
{% endblock %}

{% block version %}
0.11.2
{% endblock %}

{% block cargo_url %}
https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
adf23d455f94ceecc3f3b0df85a92cc65851c734051c46184eebdda66fa3f7f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
{% endblock %}

{% block cargo_bins %}
amdgpu_top
{% endblock %}

{% block cargo_tool %}
bld/rust/91
{% endblock %}
