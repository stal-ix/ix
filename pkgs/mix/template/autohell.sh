{% extends 'make.sh' %}

{% block configure %}
{% block autoreconf %}
{% endblock %}

{% set coflags %}
{% block coflags %}
{% endblock %}
{% endset %}

cat ./configure \
    | sed -e "s|/usr/bin/||g"             \
    | sed -e "s|/usr/|/nowhere/|g"        \
    | sed -e "s|/bin/sh|$(command -v dash)|g"  \
    | sed -e "s|/bin/arch|arch|g"         \
    | sed -e "s|/bin/uname|uname|g"       \
    | sed -e "s|/bin/machine|machine|g"   \
    | sed -e "s|/bin/universe|universe|g" \
    > _ && mv _ ./configure

export ac_cv_build="{{mix.platform.target.gnu_arch}}-{{mix.platform.target.hw_vendor}}-{{mix.platform.target.kernel}}-{{mix.platform.target.vendor}}"
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

dash ./configure ${COFLAGS} \
    --disable-dependency-tracking \
    --enable-static               \
    --disable-shared              \
    --prefix="${out}"             \
    {{mix.prepare_deps(coflags)}}
{% endblock %}
