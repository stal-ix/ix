{% extends 'ninja.sh' %}

{% set cmflags %}
-Wno-dev
-DCMAKE_INSTALL_PREFIX="${out}"
-DCMAKE_C_COMPILER="$(command -v clang)"
-DCMAKE_CXX_COMPILER="$(command -v clang++)"
-DCMAKE_AR="$(command -v ar)"
-DCMAKE_RANLIB="$(command -v ranlib)"
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=OFF
-DCMAKE_PREFIX_PATH="${CMPATH}"
-DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=NO
-DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=NO
-DCMAKE_FIND_USE_SYSTEM_PACKAGE_REGISTRY=NO

{% block cmflags %}
{% endblock %}

{% block cmdir %}
.
{% endblock %}
{% endset %}

{% block configure %}
cmake -B _build -G Ninja ${CMFLAGS} {{mix.fix_list(cmflags)}}
{% endblock %}
