{% extends 'ninja.sh' %}

{% block std_env %}
dev/build/cmake/mix.sh
{{super()}}
{% endblock %}

{% block configure %}
{% set command_args %}
cmake

-B {{ninja_build_dir}}
-G Ninja

-Wno-dev

${CMFLAGS}

-DCMAKE_INSTALL_PREFIX="${out}"
-DCMAKE_INSTALL_LIBDIR="${out}/lib"
-DCMAKE_INSTALL_LIBEXECDIR="${out}/bin/exec"
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

{% block cmake_flags %}
{% endblock %}

{% block cmake_srcdir %}
.
{% endblock %}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}
