{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.3.0.tar.gz
{% endblock %}

{% block go_sha %}
87569d4034f981c46e6aa3f2edf868925aee47c79daffe42ab2d3f44a47f59a0
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gomuks ${out}/bin/
{% endblock %}
