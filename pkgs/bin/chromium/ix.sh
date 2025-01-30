{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/chromium/unwrap(libc_lite=1,libopenssl_ver=fake,libcplpl_ver=17,clang_ver=17)
{% endblock %}
