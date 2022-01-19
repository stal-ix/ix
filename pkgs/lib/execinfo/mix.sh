{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
http://distcache.freebsd.org/local-distfiles/itetcu/libexecinfo-1.1.tar.bz2
sha:c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f
https://git.alpinelinux.org/aports/plain/main/libexecinfo/10-execinfo.patch
sha:346727e58d9ffec3e8ffda8fb3ed3d72e66cdfe52c521e668e1c117e18ebfb23
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
cat ${src}/*.patch | patch -p1
{% endblock %}

{% block build %}
cc -c stacktraverse.c
cc -c execinfo.c
ar q libexecinfo.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.h ${out}/include
cp *.a ${out}/lib
{% endblock %}
