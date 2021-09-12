{% extends '//util/make.sh' %}

{% block configure %}
{% set coflags %}{% block coflags %}{% endblock %}{% endset %}
dash ./configure $COFLAGS --prefix="$out" {{mix.prepare_deps(coflags)}}
{% endblock %}
