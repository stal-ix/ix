{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
spdlog
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://github.com/gabime/spdlog/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d8862955c6d74e5846b3f580b1605d2428b11d97a410d86e2fb13e857cd3a744
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
