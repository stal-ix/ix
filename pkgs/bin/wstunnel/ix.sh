{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
wstunnel
{% endblock %}

{% block version %}
10.4.3
{% endblock %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
517eff6d01c94b81caa53f1f17fb80cacda9c4676185eab6934b81b6bdd000ab
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/wstunnel ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
