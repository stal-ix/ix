{% extends 'ninja.sh' %}

{% block std_box %}
dev/build/cmake/mix.sh
{{super()}}
{% endblock %}

{% block configure %}
{% set command_args %}
{% block cmake_binary %}
cmake
{% endblock %}

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

-DCMAKE_SYSTEM_INCLUDE_PATH="$(echo ${MIX_INCPATH} | tr ':' ';')"
-DCMAKE_SYSTEM_LIBRARY_PATH="$(echo ${MIX_LIBPATH} | tr ':' ';')"
-DCMAKE_SYSTEM_PROGRAM_PATH="$(echo ${PATH} | tr ':' ';')"

{% block cmake_flags %}
{% endblock %}

{% block cmake_srcdir %}
.
{% endblock %}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}
