{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/478d353c73bec79bbbad833a31c50eecd4578b46.zip
7670f4b232aee6b499b937456f8c6132
{% endblock %}

{% block bld_deps %}
shell/cli/bash/minimal/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block configure %}
bash ./configure --prefix="${out}"
{% endblock %}

{% block install %}
make install
{% endblock %}
