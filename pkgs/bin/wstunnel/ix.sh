{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/erebe/wstunnel/archive/refs/tags/v10.1.5.tar.gz
{% endblock %}

{% block cargo_sha %}
6693f550a81826d14c505c445b7f6607bbe580082af494268ab20cf4012471f2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/wstunnel ${out}/bin/
{% endblock %}
