{% extends '//bin/perl/ix.sh' %}

{% block fetch %}
{{super()}}
https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/expat
{% endblock %}

{% block unpack %}
# TODO(pg): proper extract1
extract0 ${src}/perl*
cd perl*
cd ext
extract0 ${src}/XML*
mv XML* XML-Parser
ln -s XML-Parser/Expat XML-Parser-Expat
cd ..
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF >> config.sh
export static_ext="\${static_ext} XML/Parser/Expat"
EOF
{% endblock %}
