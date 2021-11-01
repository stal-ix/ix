{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
# md5 67e051268d0c475ea773822f7500d0e5
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/tools/mix.sh
env/c/mix.sh
env/bootstrap/mix.sh
{% endblock %}
