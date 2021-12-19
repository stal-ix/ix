{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://chromium.googlesource.com/v8/v8.git/+archive/refs/tags/9.9.7.tar.gz
280e44f971219e0f5435045a3862ac06
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/gn/mix.sh
dev/tool/python/mix.sh
{% endblock %}

{% block unpack %}
mkdir src; cd src; ${untar} ${src}/*.tar.gz
{% endblock %}

{% block build %}
exit 1
{% endblock %}
