{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
dht
{% endblock %}

{% block version %}
0.28
{% endblock %}

{% block fetch %}
https://github.com/jech/dht/archive/refs/tags/dht-{{self.version().strip()}}.tar.gz
2f91db29636ca84503b4bb59d7a4a6a681c3a547e12ef775f83e99b69be92f2d
https://github.com/transmission/dht/commit/b02da598.patch
91fb75029bf04456bb7fd9c7cc14d544e906d35a309cc8de5be081049aeb7649
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
cat ${src}/*patch | patch -p1
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
mkdir dht
mv *.h dht/
{% endblock %}
