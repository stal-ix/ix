{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/eranif/codelite
{% endblock %}

{% block pkg_name %}
codelite
{% endblock %}

{% block version %}
17.7.0
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
fd0ec6fa3bde2348dfff15f88c020f376ca6bc7fedeef205fcc92d6d45a43923
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ssh
lib/glib
lib/pcre/2
lib/kernel
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
