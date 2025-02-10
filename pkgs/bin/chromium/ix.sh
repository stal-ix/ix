{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/chromium/unwrap(allocator=tcmalloc/16,libopenssl_ver=fake,libcplpl_ver=17,clang_ver=17,ffmpeg_ver=6,libicu_ver=chromium,libxml_ver=chromium,libcurl_ver=lite)
{% endblock %}
