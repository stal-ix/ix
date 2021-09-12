{% extends '//util/template.sh' %}

{% block configure %}
{% set coflags %}{% block coflags %}{% endblock %}{% endset %}
dash ./configure $COFLAGS --prefix="$out" {{mix.prepare_deps(coflags)}}
{% endblock %}

{% block build %}
make $MAKE_FLAGS -j $make_thrs || make $MAKE_FLAGS
{% endblock %}

{% block install %}
make install
{% endblock %}
