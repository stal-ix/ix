{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/eranif/codelite/releases/download/17.0.0/codelite-17.0.0.tar.gz
sha:c0dfe6df38426d761ef5622b7a9ab91481244a09ad751f5daafa37bb9b611d57
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ssh
lib/glib
lib/pcre/2
lib/hunspell
lib/sqlite/3
lib/wx/widgets
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block unpack %}
{{super()}}
cd code*
find -type f -name '*.dylib' -delete
find -type f -name '*.dll' -delete
find -type f -name '*.exe' -delete
find -type f -name '*.a' -delete
find -size +1500000c -delete
>PHPRefactoring/phprefactor.phar
{% endblock %}

{% block patch %}
sed -e 's|libssh.so|libssh.a|' -i CMakeLists.txt
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
