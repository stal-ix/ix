{% extends '//util/template.sh' %}

{% block fetch %}
# url https://www.sourceware.org/pub/bzip2/bzip2-latest.tar.gz
# md5 67e051268d0c475ea773822f7500d0e5
{% endblock %}

{% block deps %}
# bld dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block build %}
make -j ${make_thrs} PREFIX="${out}"
{% endblock %}

{% block install %}
make PREFIX="${out}" install
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lbz2 \${LDFLAGS}"
{% endblock %}
