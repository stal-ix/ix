{% extends 'make.sh' %}

{% block std_env %}
dev/build/pkg-config/mix.sh
{{super()}}
{% endblock %}

{% block step_setup %}
export ac_cv_build="{{mix.platform.target.gnu_arch}}-{{mix.platform.target.hw_vendor}}-{{mix.platform.target.os}}"
export ac_cv_host="${ac_cv_build}"
export ac_cv_target="${ac_cv_build}"

{{super()}}
{% endblock %}

{% block configure %}
{% block check_tools %}
{% if not mix.name.startswith('boot/') %}
which pkg-config
{% endif %}
{% endblock %}

{% block prepare_configure %}
{% block autoreconf %}
if which libtoolize; then
    echo "RUN LIBTOOLIZE"
    libtoolize -cif
fi

if which autoreconf; then
    echo "RUN AUTORECONF"
    autoreconf -if
fi
{% endblock %}

{% block patch_configure %}
cat configure \
    | sed -e "s|/usr/bin/||g"                 \
    | sed -e "s|/usr/|/nowhere/|g"            \
    | sed -e "s|/bin/sh|$(which dash)|g"      \
    | sed -e "s|/bin/arch|arch|g"             \
    | sed -e "s|/bin/uname|uname|g"           \
    | sed -e "s|/bin/machine|machine|g"       \
    | sed -e "s|/bin/universe|universe|g"     \
    > _ && mv _ configure
{% endblock %}

(
    find . | grep 'config.guess'
    find . | grep 'config.sub'
) | while read l; do
    cat << EOF > ${l}
#!$(which dash)
echo ${ac_cv_build}
EOF
    chmod +x ${l}
done
{% endblock %}

{% block invoke_configure %}
{% set command_args %}
{% block autoconf_shell %}
dash
{% endblock %}

{% block autoconf_script %}
configure
{% endblock %}

${COFLAGS}

--disable-dependency-tracking
{% block enable_static %}
--enable-static
{% endblock %}
--disable-shared
--prefix="${out}"
--sbindir="${out}/bin"
--libexecdir="${out}/bin/exec"

{% block coflags %}
{% endblock %}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}
{% endblock %}
