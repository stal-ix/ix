{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.5/e2fsprogs-1.46.5.tar.xz
sha:2f16c9176704cf645dc69d5b15ff704ae722d665df38b2ed3cfc249757d8d81e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/auto/conf/archive
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -r include/blkid lib/libblkid.a lib/pkgconfig/blkid.pc
{% endblock %}
