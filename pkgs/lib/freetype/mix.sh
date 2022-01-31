{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
#https://download.savannah.gnu.org/releases/freetype/freetype-2.11.1.tar.xz
#24e79233d607ded439ef36ff1f3ab68f
#7bde8a0a8a2e736065e91550da60667f
https://download.savannah.gnu.org/releases/freetype/freetype-2.11.0.tar.xz
sha:8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/png
lib/bzip2
lib/brotli
{% endblock %}

{% block autoreconf %}
cat autogen.sh | sed -e 's|\./configure|\./configure; exit 0|' | sh
{% endblock %}
