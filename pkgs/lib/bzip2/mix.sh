{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
# md5 67e051268d0c475ea773822f7500d0e5
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/tools/mix.sh
# bld env/c/mix.sh
# bld env/bootstrap/package.py
{% endblock %}
