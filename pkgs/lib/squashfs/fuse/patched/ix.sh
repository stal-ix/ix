{% extends '//lib/squashfs/fuse/t/ix.sh' %}

{% block fetch %}
https://github.com/vasi/squashfuse/archive/1f980303b89c779eabfd0a0fdd36d6a7a311bf92.zip
sha:6d4f00926722d9b9a0d5a3b150a8c8ac902257b71d1fe51cf93b918022daee6f
https://raw.githubusercontent.com/AppImageCommunity/libappimage/9c1fae809dedbb3015e9cd5b46e2b5aab06df36e/src/patches/squashfuse.patch
sha:34efa870cbcc5dc790828d30908ddcfb00a60da66d1c2dfc6bd5781725ba9916
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/fuse/2
lib/shim/fake/pkg(pkg_name=squashfuse,pkg_ver=1)
{% endblock %}

{% block patch %}
{{super()}}
chmod +x gen_swap.sh
patch -p1 < ${src}/squashfuse.patch
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-high-level
--disable-demo
{% endblock %}

{% block cpp_missing %}
{{super()}}
unistd.h
{% endblock %}

{% block install %}
mkdir ${out}/include
cp *.h ${out}/include
mkdir ${out}/lib
find . -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}
