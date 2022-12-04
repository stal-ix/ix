{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/eranif/codelite/archive/refs/tags/16.0.0.tar.gz
sha:fb707b98b2f56ae0791c7cb341c6a0240ff26a785dae31f7dcd1038956737957
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ssh
lib/glib
lib/pcre/2
lib/sqlite/3
lib/hunspell
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block unpack %}
{{super()}}
find -type f -name '*.dylib' -delete
find -type f -name '*.dll' -delete
find -type f -name '*.exe' -delete
find -type f -name '*.a' -delete
find -size +1000000c -delete
>PHPRefactoring/phprefactor.phar
{% endblock %}

{% block patch %}
sed -e 's|libssh.so|libssh.a|' \
    -e 's|add_.*ctags.*||'     \
    -i CMakeLists.txt
sed -e 's|.*splitterLeft.*SetSplitterLeft.*||' -i wxcrafter/myxh_propgrid.cpp
sed -e 's|thread_local |static thread_local |' -i Plugin/globals.cpp
{% endblock %}

{% block cpp_missing %}
unistd.h
sys/types.h
sys/stat.h
fcntl.h
{% endblock %}

{% block cmake_flags %}
CL_PREFIX=${out}
{% endblock %}
