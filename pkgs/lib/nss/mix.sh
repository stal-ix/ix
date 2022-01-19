{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_66_RTM/src/nss-3.66-with-nspr-4.30.tar.gz
4addeabd4aedc1d589cc836577938da6
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block bld_tool %}
dev/tool/bash
bin/gyp
bin/make
bin/ninja
{% endblock %}

{% block setup_tools %}
ln -s $(which python2) python
{% endblock %}

{% block build %}
bash nss/build.sh -v --gyp --disable-tests --static
{% endblock %}
