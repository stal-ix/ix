{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
libnewsboat
{% endblock %}

{% block version %}
2.42
{% endblock %}

{% block cargo_url %}
https://newsboat.org/releases/{{self.version().strip()}}/newsboat-{{self.version().strip()}}.tar.xz
{% endblock %}

{% block cargo_sha %}
6eedffe6a2f884060fbc47ac88f686b783ef4bff5a33b34af2e9752a55b8d681
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cargo_packages %}
libnewsboat-ffi
{% endblock %}

{% block cargo_features %}
{% endblock %}

{% block env %}
export NEWSBOAT_CXX_INCLUDE="${out}/include"
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include/libnewsboat-ffi/src
cp ${tmp}/out/libnewsboat.a ${out}/lib/
cp ${tmp}/cxxbridge/libnewsboat-ffi/src/*.h ${out}/include/libnewsboat-ffi/src/
{% endblock %}
