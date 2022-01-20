{% extends 'ninja.sh' %}

{% block std_box %}
bin/cmake
{{super()}}
{% endblock %}

{% block functions %}
{{super()}}

add_suffix() (
    set -eu; IFS=':'; for x in ${1}; do
        echo -n "${x}/${2};"
    done
)
{% endblock %}

{% block step_setup %}
{{super()}}

export SIP=$(add_suffix ${MIX_T_DIR} include)
export SLP=$(add_suffix ${MIX_T_DIR} lib)
export SPP=$(add_suffix ${MIX_B_DIR} bin)
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

{% block cmake_install_dirs %}
-DCMAKE_INSTALL_PREFIX="${out}"
-DCMAKE_INSTALL_LIBDIR="${out}/lib"
-DCMAKE_INSTALL_LIBEXECDIR="${out}/{{kind}}/{{uniq_id}}"
{% endblock %}

-DCMAKE_C_COMPILER="$(which ${CC})"
-DCMAKE_CXX_COMPILER="$(which ${CXX})"
-DCMAKE_AR="$(which ${AR})"
-DCMAKE_NM="$(which ${NM})"
-DCMAKE_RANLIB="$(which ${RANLIB})"

-DCMAKE_BUILD_TYPE=Release

-DBUILD_SHARED_LIBS=OFF

-DCMAKE_SYSTEM_INCLUDE_PATH="${SIP}"
-DCMAKE_SYSTEM_LIBRARY_PATH="${SLP}"
-DCMAKE_SYSTEM_PROGRAM_PATH="${SPP}"

{% set cmake_flags %}
{% block cmake_flags %}
{% endblock %}
{% endset %}

{% for f in mix.parse_list(cmake_flags) %}
-D{{f}}
{% endfor %}

{% block cmake_srcdir %}
.
{% endblock %}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}
