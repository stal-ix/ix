{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
bin/clang/19(libcplpl_ver=17,crt_ver=17,zlib_ver=adler,execinfo_ver=fake,std_env=bld/boot/9/env/cxx,libc_lite=1,llvm_native=1)
{% endblock %}
