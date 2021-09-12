{% extends '//util/autohell.sh' %}

{% block fetch %}
# url http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.3.tar.gz
# md5 c7016b513f701d88c70b3082eb183581
{% endblock %}

{% block deps %}
# bld lib/intl lib/edit lib/iconv dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block cflags %}
{% if mix.platform.target.os == 'darwin' %}
export CPPFLAGS="-Dstat64=stat $CPPFLAGS"
{% endif %}

export COFLAGS=$(echo $COFLAGS | tr ' ' '\n' | grep -v 'static' | grep -v 'libedit' | tr '\n' ' ')
{% endblock %}

{% block coflags %}
--with-libedit=yes
{% endblock %}
