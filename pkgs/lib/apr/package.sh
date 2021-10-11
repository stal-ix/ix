{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2
# md5 7a14a83d664e87599ea25ff4432e48a7
{% endblock %}

{% block deps %}
# bld dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block coflags %}
--disable-dso
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lapr-1 \${LDFLAGS}"
export COFLAGS="--with-apr=${out} --with-libapr=${out} \${COFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
{% endblock %}
