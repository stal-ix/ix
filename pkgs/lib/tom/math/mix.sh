{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/libtom/libtommath/releases/download/v1.2.0/ltm-1.2.0.tar.xz
# md5 159523e41d528ce72a0ce4ac3eabe274
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
dev/build/make/mix.sh
{% endblock %}
