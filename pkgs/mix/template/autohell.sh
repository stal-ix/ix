{% extends 'make.sh' %}

{% block std_box %}
dev/build/pkg-config
{{super()}}
{% endblock %}

{% block step_patch %}
{% block touch_yl %}
find . | grep '\.[yl]$' | while read l; do
    echo "TOUCH ${l}"
    touch ${l}
done
{% endblock %}

(
{{super()}}
)

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
    | sed -e "s|/usr/bin/||g"             \
    | sed -e "s|/usr/|/nowhere/|g"        \
    | sed -e "s|/bin/sh|$(which sh)|g"    \
    | sed -e "s|/bin/arch|arch|g"         \
    | sed -e "s|/bin/uname|uname|g"       \
    | sed -e "s|/bin/machine|machine|g"   \
    | sed -e "s|/bin/universe|universe|g" \
    > _ && mv _ configure
{% endblock %}
{% endblock %}

{% block configure %}
{% block check_tools %}
{% if not name.startswith('boot/') %}
which pkg-config
{% endif %}
{% endblock %}

{% block invoke_configure %}
{% set command_args %}
{% block configure_shell %}
sh
{% endblock %}

{% block configure_script %}
configure
{% endblock %}

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

--prefix="${out}"
--sbindir="${out}/bin"
--libexecdir="${out}/bin/exec"

{% block configure_flags %}
{% endblock %}
{% endset %}

{{mix.fix_list(command_args)}}
{% endblock %}
{% endblock %}
