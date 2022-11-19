{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.iozone.org/src/current/iozone3_494.tgz
sha:a36d43831e2829dbc9dc3d5a5a7eb1ca733c9ecc8cbb634022a52928e9b78662
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block unpack %}
{{super()}}
cd src/current
make clean
{% endblock %}

{% block make_target %}
linux
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp iozone fileop ${out}/bin/
{% endblock %}
