{% extends '//bin/samurai/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/7/env/std
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s samu ninja
{% endblock %}
