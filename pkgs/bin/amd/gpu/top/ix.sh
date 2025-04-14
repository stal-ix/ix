{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
amdgpu_top
{% endblock %}

{% block version %}
0.10.4
{% endblock %}

{% block cargo_url %}
https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
1fe91e95e3eb5f9cf4c409a5b684581d4361734ea4d052ca076d9bed838331b6
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
{% endblock %}

{% block cargo_bins %}
amdgpu_top
{% endblock %}

{% block cargoc_ver %}
bld/cargo/86
{% endblock %}

{% block rustc_ver %}
86
{% endblock %}
