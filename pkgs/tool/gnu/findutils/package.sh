{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz
# md5 eeefe2e6380931a77dfa6d9350b43186
{% endblock %}

{% block deps %}
# bld env/c lib/iconv boot/final/env/tools
{% endblock %}

{% block patch %}
echo '#define __nonnull(x)' > tmp
cat gl/lib/malloc/dynarray-skeleton.c >> tmp
mv tmp gl/lib/malloc/dynarray-skeleton.c
{% endblock %}
