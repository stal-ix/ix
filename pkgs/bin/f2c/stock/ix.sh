{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//lib/f2c/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block patch %}
mv makefile.u Makefile
{% endblock %}

{% block make_target %}
f2c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp f2c ${out}/bin/
{% endblock %}
