{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rhboot/efibootmgr/archive/refs/tags/18.tar.gz
sha:442867d12f8525034a404fc8af3036dba8e1fc970998af2486c3b940dfad0874
{% endblock %}

{% block bld_libs %}
lib/c
lib/popt
lib/linux
lib/efivar
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block make_flags %}
EFIDIR=/boot/efi
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin bin
{% endblock %}
