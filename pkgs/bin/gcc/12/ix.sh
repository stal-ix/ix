{% extends '//bin/gcc/11/ix.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-12.3.0/gcc-12.3.0.tar.xz
sha:949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*linker input file unused because linking not done.*|(void)(|' -i gcc/gcc.cc
{% endblock %}
