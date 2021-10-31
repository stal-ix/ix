{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/michaelforney/samurai/archive/edeec43d638c826d9e446917f97e95151988e0e0.zip
# md5 2321662d68a58456cc9ac9a2605beb59
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dwarn=samu_warn ${CPPFLAGS}"
{% endblock %}

{% block build %}
make PREFIX=${out}
{% endblock %}

{% block install %}
make PREFIX=${out} install

cd ${out}/bin && ln -s samu ninja
{% endblock %}
