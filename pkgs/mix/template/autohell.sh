{% extends 'make.sh' %}

{% block configure %}
{% block autoreconf %}
{% endblock %}

{% block check_tools %}
{% if not mix.name.startswith('boot/') %}
command -v pkg-config
{% endif %}
{% endblock %}

cat ./configure \
    | sed -e "s|/usr/bin/||g"                 \
    | sed -e "s|/usr/|/nowhere/|g"            \
    | sed -e "s|/bin/sh|$(command -v dash)|g" \
    | sed -e "s|/bin/arch|arch|g"             \
    | sed -e "s|/bin/uname|uname|g"           \
    | sed -e "s|/bin/machine|machine|g"       \
    | sed -e "s|/bin/universe|universe|g"     \
    > _ && mv _ ./configure

export ac_cv_build="{{mix.platform.target.gnu_arch}}-{{mix.platform.target.hw_vendor}}-{{mix.platform.target.os}}"
export ac_cv_host="${ac_cv_build}"
export ac_cv_target="${ac_cv_build}"

(
    find . | grep 'config.guess'
    find . | grep 'config.sub'
) | while read l; do
    cat << EOF > ${l}
#!$(command -v dash)
echo ${ac_cv_build}
EOF
    chmod +x ${l}
done

{% block invoke_configure %}
{% set coflags %}
--disable-dependency-tracking
{% block enable_static %}
--enable-static
{% endblock %}
--disable-shared
--prefix="${out}"

{% block coflags %}
{% endblock %}
{% endset %}

{% block autoconf_shell %}dash{% endblock %} ./configure ${COFLAGS} {{mix.fix_list(coflags)}}
{% endblock %}
{% endblock %}
