{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
dht
{% endblock %}

{% block version %}
0.27
{% endblock %}

{% block fetch %}
https://github.com/jech/dht/archive/refs/tags/dht-{{self.version().strip()}}.tar.gz
caba469a784a5c359c084099fdc025cfe09b1faec2ba9ba257b7384351c43c0a
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
