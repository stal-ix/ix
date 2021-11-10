{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/pullmoll/musl-rpmatch/archive/refs/tags/v1.0.tar.gz
8f5a5022fa66d94b7b0934618dfa6350
{% endblock %}

{% block bld_deps %}
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
{{super()}}
{% endblock %}

{% block autoreconf %}
dash ./bootstrap.sh
{% endblock %}
