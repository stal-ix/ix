{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.18.0.tar.gz
sha:989e36fac1d736cc9e9a1bae26e3feb6b0e4deefed761cb26bed75b7d6e4acc5
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
