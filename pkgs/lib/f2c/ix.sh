{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
mkdir lib; cd lib
extract 0 ../libf2c.zip
{% endblock %}

{% block make_flags %}
LIBDIR=${out}/lib
{% endblock %}

{% block patch %}
mv makefile.u Makefile
sed -e 's|.*ld.*xxx.*||' -e 's|.*mv.*xxx.*||' -i Makefile
>fpu_control.h
{% endblock %}

{% block install %}
mkdir ${out}/lib
{{super()}}
{% endblock %}
