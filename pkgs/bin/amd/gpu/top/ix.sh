{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
amdgpu_top
{% endblock %}

{% block version %}
0.10.5
{% endblock %}

{% block cargo_url %}
https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3e75f56d83735e174710472a3e0e95b044e2c91c9db80ed134f753e1878dd71a
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
