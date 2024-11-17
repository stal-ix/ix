{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/14/gcc(std_env=bld/boot/8/env/cxx,zlib_ver=adler,execinfo_ver=fake,llvm_native=1)
{% endblock %}
