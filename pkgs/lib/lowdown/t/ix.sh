{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lowdown
{% endblock %}

{% block version %}
3.1.1
{% endblock %}

{% block make_tool %}
bld/make
bin/bmake
{% endblock %}

{% block make_bin %}
bmake
{% endblock %}

{% block fetch %}
https://github.com/kristapsdz/lowdown/archive/refs/tags/VERSION_{{self.version().strip().replace('.', '_')}}.tar.gz
6676ff3c37f4958615906dae6c03ecd24c40509fd85c06acc98f55fa77e2d61c
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
--- a/configure
+++ b/configure
@@ -2628,19 +2628,17 @@ cat << __HEREDOC__
-#if HAVE_SYS_CDEFS_H
-# include <sys/cdefs.h>
-#endif
-
-#ifndef __dead
-# define __dead __attribute__((__noreturn__))
-#endif /* !__dead */
-
-#ifndef __pure
-# define __pure __attribute__((__pure__))
-#endif /* !__pure */
-
-#ifndef __unused
-# define __unused __attribute__((__unused__))
-#endif /* !__unused */
-
-#ifndef __used
-# define __used __attribute__((__used__))
-#endif /* !__used */
+#if ENABLE_BSD_CDEFS
+# if HAVE_SYS_CDEFS_H
+#  include <sys/cdefs.h>
+# endif
+# ifndef __dead
+#  define __dead __attribute__((__noreturn__))
+# endif /* !__dead */
+# ifndef __pure
+#  define __pure __attribute__((__pure__))
+# endif /* !__pure */
+# ifndef __unused
+#  define __unused __attribute__((__unused__))
+# endif /* !__unused */
+# ifndef __used
+#  define __used __attribute__((__used__))
+# endif /* !__used */
+#endif /* ENABLE_BSD_CDEFS */
EOF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure PREFIX=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
