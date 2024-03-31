{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.3.0.tar.gz
{% endblock %}

{% block go_sha %}
46ac07dd18576172081302702280e1fa97a029f4088c8f9550113dbf9317de2d
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gomuks ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
