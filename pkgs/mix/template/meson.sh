{% extends 'ninja.sh' %}

{% block std_env %}
{{'dev/lang/cctools/mix.sh' | darwin}}
dev/build/meson/mix.sh
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{{super()}}
{% endblock %}

{% set meson_flags %}
--libdir="${out}/lib"
--libexecdir="${out}/bin/exec"

-Dprefix="${out}"
-Ddefault_library=static
-Dwerror=false

{% if mix.platform.target.os == 'darwin' %}
-Db_asneeded=false
-Db_lundef=false
{% endif %}

{% block meson_flags %}
{% endblock %}
{% endset %}

{% block configure %}
meson {{mix.fix_list(meson_flags)}} {{ninja_build_dir}}
{% endblock %}

{% block step_patch %}
{{super()}}

find . | grep meson.build | while read l; do
    sed -e 's|shared_library|library|g' -i ${l}
done
{% endblock %}
