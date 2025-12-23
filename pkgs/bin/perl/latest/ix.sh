{% extends '//bin/perl/host/ix.sh' %}

{% block pkg_name %}
perl
{% endblock %}

{% block version %}
5.40.2
{% endblock %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-{{self.version().strip()}}.tar.gz
10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d
{% endblock %}

{% block dup_symbols %}
Perl_add_above_Latin1_folds
Perl_get_ANYOFHbbm_contents
Perl_get_ANYOFM_contents
Perl_populate_anyof_bitmap_from_invlist
Perl_populate_bitmap_from_invlist
Perl_populate_invlist_from_bitmap
Perl_set_ANYOF_arg
Perl_reg_add_data
{% endblock %}

{% block build1 %}
make libperl.a
llvm-objcopy \
{% for x in self.dup_symbols() | parse_list %}
    --redefine-sym {{x}}=xxx_{{x}} \
{% endfor %}
    libperl.a
{{super()}}
{% endblock %}
