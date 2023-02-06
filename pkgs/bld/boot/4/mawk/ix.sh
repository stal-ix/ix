{% extends '//bin/mawk/ix.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20200120.tgz
sha:7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/4/byacc
bld/boot/3/env
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin && ln -s mawk awk
{% endblock %}
