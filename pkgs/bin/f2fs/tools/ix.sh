{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
f2fs-tools
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/f2fs-tools-{{self.version().strip()}}.tar.gz
1dbc89ada373b43cc9130b47ad3f575117583ca74715e952046c88a121a2a469
{% endblock %}

{% block bld_libs %}
lib/c
lib/lz4
lib/kernel
lib/e2fsprogs
lib/bsd/overlay
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -22,7 +22,9 @@
 #include <getopt.h>
 #include <inttypes.h>
 #include <limits.h>
+#include <linux/falloc.h>
 #include <linux/fs.h>
+#include <linux/mman.h>
 #include <signal.h>
 #include <stdarg.h>
 #include <sys/uio.h>
EOF
{% endblock %}

{% block cpp_defines %}
aligned_alloc=memalign
{% endblock %}
