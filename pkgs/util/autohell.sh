{% extends '//util/make.sh' %}

{% block configure %}
{% set coflags %}
{% block coflags %}
{% endblock %}
{% endset %}

cat ./configure \
    | sed -e "s|/usr/bin/||g"             \
    | sed -e "s|/usr/|/nowhere/|g"        \
    | sed -e "s|/bin/sh|$(which dash)|g"  \
    | sed -e "s|/bin/arch|arch|g"         \
    | sed -e "s|/bin/uname|uname|g"       \
    | sed -e "s|/bin/machine|machine|g"   \
    | sed -e "s|/bin/universe|universe|g" \
    > _ && mv _ ./configure

dash ./configure ${COFLAGS} --prefix="${out}" {{mix.prepare_deps(coflags)}}
{% endblock %}
