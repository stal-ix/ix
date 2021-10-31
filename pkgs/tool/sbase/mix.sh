{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/sbase/archive/2c2a7f54ab55a022a617e510b6e00c3e2736fabd.zip
# md5 003346537cccb2b6444516b3fc1c027f
{% endblock %}

{% block deps %}
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Dreallocarray=sbase_reallocarray ${CPPFLAGS}"
{% endblock %}

{% block patch %}
chmod +x getconf.sh
cat util.h | grep -v 'undef realloc' > _ && mv _ util.h
{% endblock %}

{% block build %}
make PREFIX="${out}" -j ${make_thrs}
export PATH="${PWD}:${PATH}"
make PREFIX="${out}" sbase-box
{% endblock %}

{% block install %}
export PATH="${PWD}:${PATH}"
make PREFIX="${out}" sbase-box-install
{% endblock %}
