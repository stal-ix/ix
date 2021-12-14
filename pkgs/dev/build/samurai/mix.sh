{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/michaelforney/samurai/archive/edeec43d638c826d9e446917f97e95151988e0e0.zip
2321662d68a58456cc9ac9a2605beb59
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dwarn=samu_warn ${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && ln -s samu ninja
{% endblock %}
