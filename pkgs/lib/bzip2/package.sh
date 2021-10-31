{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
# md5 67e051268d0c475ea773822f7500d0e5
{% endblock %}

{% block deps %}
# bld dev/build/make/package.sh
# bld env/tools/package.sh
# bld env/c/package.sh
# bld env/bootstrap/package.py
{% endblock %}
