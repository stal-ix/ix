{% extends 'ninja.sh' %}

{% block std_env %}
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

{% block meson_flags %}
{% endblock %}

{{ninja_build_dir}}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}

{% block step_patch %}
{% if super().strip() %}
(
    set -eu

{{super()}}
)
{% endif %}

find . | grep meson.build | while read l; do
    sed -e 's|shared_library|library|g' -i ${l}
done
{% endblock %}
