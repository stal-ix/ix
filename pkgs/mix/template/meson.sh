{% extends 'ninja.sh' %}

{% block std_box %}
{% if target.os == 'darwin' %}
dev/lang/cctools/mix.sh
{% endif %}
dev/build/meson/mix.sh
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
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
--libexecdir="${out}/bin/exec"

-Dprefix="${out}"
-Ddefault_library=static
-Dwerror=false

{% if target.os == 'darwin' %}
-Db_asneeded=false
-Db_lundef=false
{% endif %}

{% block meson_cross %}
--cross-file="${tmp}/cross.ini"
--pkg-config-path="${PC_T}"
--build.pkg-config-path="${PC_H}"
{% endblock %}

{% block meson_flags %}
{% endblock %}

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

find . | grep meson.build | while read l; do
    # danger, Will Robinson!
    cat ${l} \
        | grep -v 'subdir.*test' \
        | grep -v 'subdir.*exam' \
        | grep -v 'subdir.*demo' \
        | grep -v 'subdir.*fuzz' \
        | sed -e 's|shared_library|library|g' \
        | sed -e 's|shared_module|library|g' \
        > _ && mv _ ${l}
done
{% endblock %}
