{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/mold(std_env=boot/8/env/cxx,opt=fast,openssl=md)
{% endblock %}

{% block ind_deps %}
bld/linker/lib
{% endblock %}
