{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/l4l/yofi/archive/refs/tags/0.2.2.tar.gz
{% endblock %}

{% block cargo_sha %}
6b8a377f0bd07236d1824632f8193489493c781afc98348f45dda7f271aff163
{% endblock %}

{% block bld_libs %}
lib/xkb/common
lib/fontconfig/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/yofi ${out}/bin/
{% endblock %}
