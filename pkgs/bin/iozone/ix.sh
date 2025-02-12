{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.iozone.org/src/current/iozone3_507.tgz
sha:dd03eccd3768e8400816d67ae0e47f4646cb5834cfc2fc09927fe7b87a6fca7a
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
