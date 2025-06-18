{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
evsieve
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block cargo_url %}
https://github.com/KarsMulder/evsieve/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
cdc0f12d784b7e04f527af5eef3bbfdf10037e270e3c1bd193e6b87cba39f922
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/evdev
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/evsieve ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
