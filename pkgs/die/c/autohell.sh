{% extends 'configure.sh' %}

{% block step_setup %}
export FORCE_UNSAFE_CONFIGURE=1
{{super()}}
{% endblock %}

{% block configure %}
{% if not tool %}
export CC_FOR_BUILD=${HOST_CC}
{% endif %}
{% if not boot %}
{#
#ac_cv_func_canonicalize_file_name=yes
#ac_cv_func_sbrk=yes
#ac_cv_have_decl_memmem=yes
#}
export ac_cv_type_struct_sockaddr_storage=yes
export ac_ct_CC=${CC}
export ac_cv_type_sighandler_t=yes
export ac_cv_header_stdc=yes
export am_cv_CC_dependencies_compiler_type=gcc3
export ac_cv_c_compiler_gnu=yes
export lt_cv_sys_max_cmd_len=32768
export ac_cv_header_stdbool_h=yes
export gl_cv_func_realpath_works=yes
export gt_cv_int_divbyzero_sigfpe=yes
export gl_cv_func_posix_spawn_file_actions_addclose_works=yes
export gl_cv_func_fchownat_empty_filename_works=yes
{% endif %}
{{super()}}
{% if not tool %}
{% if 1 %}
mkdir -p /ix/logs/${IX_RANDOM}
ls -la > /ix/logs/${IX_RANDOM}/ls
cp config.log /ix/logs/${IX_RANDOM}/ || true
cp configure /ix/logs/${IX_RANDOM}/ || true
{% endif %}
{% endif %}
{% endblock %}

{% block step_patch %}
{% block touch_yl %}
find . -type f | grep '\.[yl]$' | while read l; do
    echo "TOUCH ${l}"
    touch ${l}
done
{% endblock %}

{% if super().strip() %}
(
{{super()}}
)
{% endif %}

{% block patch_configure %}
find . -type f -name configure | while read l; do
    sed -e "s|/usr/bin/||g"             \
        -e "s|/usr/|/nowhere/|g"        \
        -e "s|/bin/sh|$(which sh)|g"    \
        -e "s|/bin/arch|arch|g"         \
        -e "s|/bin/uname|uname|g"       \
        -e "s|/bin/machine|machine|g"   \
        -e "s|/bin/universe|universe|g" \
        ${l} > _ && mv _ ${l}

    chmod +x ${l}
done
{% endblock %}
{% endblock %}

{% block configure_all_flags %}
${COFLAGS}

{% block configure_cross %}
{% if bin %}
--program-prefix={{bin_prefix or ''}}
--target={{for_target or target.gnu.three}}
{% else %}
--program-prefix=
--target={{target.gnu.three}}
{% endif %}

--build={{host.gnu.three}}
--host={{target.gnu.three}}
{% endblock %}

--enable-silent-rules
--disable-dependency-tracking

{% block enable_static %}
--enable-static
{% endblock %}
--disable-shared

{{super()}}
{% endblock %}
