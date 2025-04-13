{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
amdgpu_top
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block cargo_url %}
https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
17810a2a26680eeaa69fb0c0edb0f84e8666368ef2e985022911761aed53cc9a
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
{% endblock %}

{% block cargo_bins %}
amdgpu_top
{% endblock %}
