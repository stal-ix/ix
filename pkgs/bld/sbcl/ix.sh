{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.1/sbcl-2.2.1-source.tar.bz2
sha:5dd6e6e3f08b7c6edf262a0e844a9f8b5e562cca08155034c1f2c014fc9087da
{% endblock %}

{% block bld_tool %}
bin/ecl
{{super()}}
{% endblock %}

{% block boot_lisp %}
ecl -norc
{% endblock %}

{% block extern_symbols %}
alloc_unboxed
close_thread_region
closefrom_fallback
context_eflags_addr
copy_possibly_large_object
dump_spaces
dynamic_space_free_pointer
gc_allocate_dirty
gc_close_all_regions
gc_general_alloc
scav_code_header
scav_weak_pointer
suballocator_end_ptr
suballocator_free_ptr
sync_close_region
zero_dirty_pages
{{super()}}
{% include 'sbcl' %}
{% endblock %}
