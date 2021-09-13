{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
# md5 a6eb7fb1f2c21fa80030a47993853e92
{% endblock %}

{% block deps %}
# bld dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block build %}
(cd lib && make PREFIX=${out} -j ${make_thrs} install-static)
(cd programs && make PREFIX=${out} -j ${make_thrs} install)
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lzstd \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}
