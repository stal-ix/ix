{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
67e051268d0c475ea773822f7500d0e5
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}
