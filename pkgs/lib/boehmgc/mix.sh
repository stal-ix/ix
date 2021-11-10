{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/ivmai/bdwgc/releases/download/v8.0.4/gc-8.0.4.tar.gz
67a5093e2f9f381bd550aa891d00b54b
https://github.com/ivmai/bdwgc/commit/5668de71107022a316ee967162bc16c10754b9ce.patch?full_index=1
10435b33b8cf10ff0afa043f04ccc324
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
lib/atomicops/mix.sh
{% endblock %}

{% block patch %}
cat ${src}/*.patch* | patch -p1
{% endblock %}

{% block coflags %}
--disable-debug
--enable-cplusplus
--enable-large-config
{% endblock %}

{% block env %}
export COFLAGS="--with-libgc-prefix=${out} \${COFLAGS}"
{% endblock %}
