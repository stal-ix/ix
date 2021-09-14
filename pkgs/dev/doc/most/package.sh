{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://www.jedsoft.org/releases/most/most-5.1.0.tar.gz
# md5 0dc19e6045f689686e8579b2835cfdc6
{% endblock %}

{% block deps %}
# bld lib/slang
# bld env/std
# bld dev/build/make
{% endblock %}

{% block coflags %}
--with-slang=$lib_slang
{% endblock %}
