{% extends 'ninja.sh' %}

{% block std_env %}
dev/build/cmake/mix.sh
{{super()}}
{% endblock %}

{% set cmflags %}
-DCMAKE_INSTALL_PREFIX="${out}"
-DCMAKE_INSTALL_LIBDIR="${out}/lib"
-DCMAKE_C_COMPILER="$(which clang)"
-DCMAKE_CXX_COMPILER="$(which clang++)"
-DCMAKE_AR="$(which ar)"
-DCMAKE_RANLIB="$(which ranlib)"
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
cmake -B {{ninja_build_dir}} -G Ninja -Wno-dev ${CMFLAGS} {{mix.fix_list(cmflags)}}
{% endblock %}
