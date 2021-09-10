# dep boot/lib/cxx
# dep boot/stage/6/cmake boot/stage/6/python boot/stage/5/env
# run env/clang
{% extends '//util/build_clang.sh' %}

{% block prebuild %}
echo > llvm/unittests/Support/DynamicLibrary/CMakeLists.txt
{% endblock %}
