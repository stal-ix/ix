{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spdlog
{% endblock %}

{% block version %}
1.15.2
{% endblock %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7a80896357f3e8e920e85e92633b14ba0f229c506e6f978578bdc35ba09e9a5d
{% endblock %}

{#
In file included from /ix/build/1CSxo5rdMFZED0UcODcPm7/src/src/spdlog.cpp:8:
In file included from /ix/build/1CSxo5rdMFZED0UcODcPm7/src/include/spdlog/common-inl.h:7:
In file included from /ix/build/1CSxo5rdMFZED0UcODcPm7/src/include/spdlog/common.h:50:
/ix/build/1CSxo5rdMFZED0UcODcPm7/src/include/spdlog/fmt/fmt.h:28:14: fatal error: 'fmt/base.h' file not found
    28 |     #include <fmt/base.h>
       |              ^~~~~~~~~~~~
    1 error generated.
#}

{% block lib_deps %}
lib/c
lib/c++
lib/fmt
{% endblock %}

{% block cmake_flags %}
SPDLOG_FMT_EXTERNAL=ON
SPDLOG_BUILD_EXAMPLE=OFF
#SPDLOG_USE_STD_FORMAT=ON
{% endblock %}

{% block env %}
export CPPFLAGS="-DSPDLOG_FMT_EXTERNAL \${CPPFLAGS}"
{% endblock %}
