{% extends '//util/make.sh' %}

{% block prepatch %}
cat ./configure | sed -e 's|/usr/bin/||' > ${tmp}/conf && mv ${tmp}/conf ./configure
{% endblock %}

{% block configure %}
{% set coflags %}
{% block coflags %}
{% endblock %}
{% endset %}

dash ./configure ${COFLAGS} --prefix="${out}" {{mix.prepare_deps(coflags)}}
{% endblock %}
