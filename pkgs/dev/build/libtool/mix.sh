{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
addf44b646ddb4e3919805aa88fa7c5e
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block install %}
{{super()}}

rm -rf ${out}/lib ${out}/include

cd ${out}/bin

ln -s libtoolize glibtoolize
ln -s libtool glibtool
{% endblock %}

{% block env %}
export LIBTOOLIZE=libtoolize
{% endblock %}
