{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/sbase/archive/2c2a7f54ab55a022a617e510b6e00c3e2736fabd.zip
003346537cccb2b6444516b3fc1c027f
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dreallocarray=sbase_reallocarray ${CPPFLAGS}"
{% if target.os == 'darwin' %}
export CPPFLAGS="-D_DARWIN_C_SOURCE=1 -Dst_atim=st_atimespec -Dst_mtim=st_mtimespec -Dst_ctim=st_ctimespec ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block make_target %}
sbase-box
{% endblock %}

{% block make_install_target %}
sbase-box-install
{% endblock %}

{% block install %}
export PATH="${PWD}:${PATH}"
ln -s sbase-box ln
{{super()}}
{% endblock %}

{% block patch %}
chmod +x getconf.sh
cat util.h | grep -v 'undef realloc' > _ && mv _ util.h
{% endblock %}
