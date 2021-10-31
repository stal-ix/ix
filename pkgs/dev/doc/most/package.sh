{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://www.jedsoft.org/releases/most/most-5.1.0.tar.gz
# md5 0dc19e6045f689686e8579b2835cfdc6
{% endblock %}

{% block deps %}
# bld lib/slang/package.sh
# bld env/std/package.sh
# bld dev/build/make/package.sh
{% endblock %}
