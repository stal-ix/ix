{% extends '//dev/build/samurai/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s samu ninja
{% endblock %}
