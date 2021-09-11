{% extends '//util/template.sh' %}

{% block configure %}
{% set coflags %}{% block coflags %}{% endblock %}{% endset %}
dash ./configure $COFLAGS --prefix="$out" {{mix.prepare_deps(coflags)}}
{% endblock %}

{% block build %}
make -j $make_thrs
{% endblock %}

{% block install %}
make install
{% endblock %}
