{% extends '//util/make.sh' %}

{% block configure %}
{% set coflags %}
{% block coflags %}
{% endblock %}
{% endset %}

cat ./configure | sed -e 's|/usr/bin/||g' > _ && mv _ ./configure
dash ./configure ${COFLAGS} --prefix="${out}" {{mix.prepare_deps(coflags)}}
{% endblock %}
