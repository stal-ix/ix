{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v0.10.0.tar.gz
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
