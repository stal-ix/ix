{% extends 'ninja.sh' %}

{% block std_box %}
{% if darwin %}
bin/cctools
{% endif %}
{% block meson_binary %}
bin/meson
{% endblock %}
{% block meson_cmake %}
bin/cmake
{% endblock %}
bin/pkg-config
{{super()}}
{% endblock %}

{% block step_setup %}
{{super()}}

export CPPFLAGS="-Wno-unknown-warning-option ${CPPFLAGS}"

export PC_H=$(
    export PKG_COFIG_PATH=
    source_env "${MIX_B_DIR}:${MIX_H_DIR}"
    echo ${PKG_CONFIG_PATH}
)

export PC_T=$(
    export PKG_COFIG_PATH=
    source_env "${MIX_T_DIR}"
    echo ${PKG_CONFIG_PATH}
)

cat << EOF > ${tmp}/cross.ini
[host_machine]
system = '{{target.os}}'
cpu_family = '{{target.gnu_arch}}'
cpu = '{{target.gnu_arch}}'
endian = '{{target.endian}}'
EOF
{% endblock %}

{% block configure %}
{% set command_args %}
meson

--libdir="${out}/lib"
--libexecdir="${out}/{{kind}}/{{uniq_id}}"

{% block meson_cross %}
--cross-file="${tmp}/cross.ini"
--pkg-config-path="${PC_T}"
--build.pkg-config-path="${PC_H}"
{% endblock %}

{% set meson_flags %}
prefix="${out}"
default_library=static
werror=false

{% if darwin %}
b_asneeded=false
b_lundef=false
{% endif %}

{% block meson_flags %}
{% endblock %}
{% endset %}

{% for f in mix.parse_list(meson_flags) %}
-D{{f}}
{% endfor %}

{{ninja_build_dir}}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}

{% block step_patch %}
{% if super().strip() %}
(
{{super()}}
)
{% endif %}

find . -type f -name '*.wrap' -delete

find . -type f -name meson.build | while read l; do
    # danger, Will Robinson!
    cat ${l} \
{% block meson_strip_dirs %}
        | grep -v 'subdir.*test' \
        | grep -v 'subdir.*exam' \
        | grep -v 'subdir.*demo' \
        | grep -v 'subdir.*fuzz' \
{% endblock %}
        | sed -e 's|both_libraries|library|g' \
        | sed -e 's|shared_library|library|g' \
        | sed -e 's|shared_module|library|g' \
        > _ && mv _ ${l}
done
{% endblock %}
