{% extends '//mix/template/template.sh' %}

{% block deps %}
# bld shell/cli/bash/minimal/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block fetch %}
# url https://github.com/jeaye/stdman/archive/478d353c73bec79bbbad833a31c50eecd4578b46.zip
# md5 7670f4b232aee6b499b937456f8c6132
{% endblock %}

{% block configure %}
bash ./configure --prefix="${out}"
{% endblock %}

{% block install %}
make install
{% endblock %}
