{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/unrarsrc-6.0.6.tar.gz
4c89e2e5ecfe72a9d96478fb80f38c34
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}

{% block make_flags %}
-f makefile
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp unrar ${out}/bin/
{% endblock %}
