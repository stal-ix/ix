{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
shotman
{% endblock %}

{% block version %}
0.4.7
{% endblock %}

{% block cargo_url %}
https://git.sr.ht/~whynothugo/shotman/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
a04882779c81368d7830cedc8fec549087cd3400b14d9a00704df788b96c1ac8
{% endblock %}

{% block bld_libs %}
lib/xkb/common
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/shotman ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
