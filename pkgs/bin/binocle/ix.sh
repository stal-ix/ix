{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
binocle
{% endblock %}

{% block version %}
0.3.2
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/binocle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
98b58ecea626793de0d77e7728043f332c48a83527c4144a8d50e0c66e5d9d03
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/binocle ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
