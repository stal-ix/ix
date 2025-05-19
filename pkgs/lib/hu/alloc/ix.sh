{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/Foreseerr/TScale/archive/bda5123ede2430ce66935a8ab2fca698b232bdf2.zip
sha:1b0da12d0bdaca6f17da4355422e45d393213ba03f183d2bf29e1b695cac8345
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block unpack %}
{{super()}}
cd code/util/
{% endblock %}

{% block c_flags %}
-msse4.2
{% endblock %}

{% block cpp_flags %}
-D_linux_=1
{% endblock %}

{% block build %}
cc -c hu_alloc.cpp
ar q libhu_alloc.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
