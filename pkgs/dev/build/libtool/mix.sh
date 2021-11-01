{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
# md5 addf44b646ddb4e3919805aa88fa7c5e
{% endblock %}

{% block bld_deps %}
dev/lang/m4/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}
