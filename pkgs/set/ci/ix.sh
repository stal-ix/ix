{% extends '//die/hub.sh' %}

{% block run_deps %}
set/ci/tier/0
set/ci/tier/1
set/ci/tier/2
# for repology
lib/fmt/11
lib/fmt/12
lib/botan/3
lib/wlroots/19
lib/json/nlohmann/12
lib/ffmpeg/9
lib/openssl/4
lib/mbedtls/4
lib/glaze/9
lib/boost/90
lib/mimalloc/3
lib/gperftools/19
aux/fonts/adobe/source/code-pro
aux/fonts/adobe/source/sans
aux/fonts/adobe/source/serif
aux/fonts/awesome
aux/fonts/dejavu
aux/fonts/google/fira
aux/fonts/google/noto/full
aux/fonts/google/noto/otf
aux/fonts/google/roboto
aux/fonts/ibm/plex
aux/fonts/intel/one/mono
aux/fonts/inter
aux/fonts/ms/consolas
aux/fonts/ms/core
aux/fonts/ms/segoe
aux/fonts/ms/vista
aux/fonts/ms/win7
aux/fonts/ms/cascadia
aux/fonts/sf/compact
aux/fonts/sf/mono
aux/fonts/sf/ny
aux/fonts/sf/pro
aux/fonts/nerd
aux/fonts/adwaita
aux/fonts/emoji
{% endblock %}
