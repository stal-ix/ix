{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/eranif/codelite
{% endblock %}

{% block git_tag %}
17.7.0
{% endblock %}

{% block git_sha %}
4f69c90f0e5c5c3b118935011a7e020b86946a35accf62b6ee37b4e8a19e8a0f
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
fcntl.h
unistd.h
sys/stat.h
sys/types.h
{% endblock %}

{% block cmake_flags %}
CL_PREFIX=${out}
{% endblock %}
