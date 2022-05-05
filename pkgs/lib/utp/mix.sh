{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/bittorrent/libutp/archive/2b364cbb0650bdab64a5de2abb4518f9f228ec44.zip
sha:0c7c324bd39c6f6862a7e1f02b9aaa020bb8a46231761308dcab90fd1503fa28
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CXX=clang++
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/pkgconfig ${out}/include/libutp
cp *.a ${out}/lib/
cp *.h ${out}/include/libutp/
{{hooks.gen_pc('utp', 'r99')}}
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libutp \${CPPFLAGS}"
{% endblock %}
