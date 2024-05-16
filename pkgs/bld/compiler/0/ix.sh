{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
bin/clang/18(libcplpl_ver=17,crt_ver=17,zlib_ver=adler,execinfo_ver=fake,std_env=bld/boot/8/env/cxx,llvm_native=1)
{% endblock %}
