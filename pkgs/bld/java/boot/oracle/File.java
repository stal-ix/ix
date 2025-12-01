package java.io;

import java.net.URI;
import java.net.URL;
import java.net.MalformedURLException;
import java.security.SecureRandom;
import java.nio.file.Path;
import java.io.FileSystem;

public class File implements Serializable, Comparable<File> {
    private static FileSystem fs = null;
    private String path;
    
    private static enum PathStatus {
        /*public static final*/ INVALID /*enum*/ ,
        /*public static final*/ CHECKED /*enum*/ ;
    }
    private transient PathStatus status = null;
    
    final native boolean isInvalid();
    private transient int prefixLength;
    
    native int getPrefixLength();
    public static final char separatorChar = fs.getSeparator();
    public static final String separator = "" + separatorChar;
    public static final char pathSeparatorChar = fs.getPathSeparator();
    public static final String pathSeparator = "" + pathSeparatorChar;
    
    private File(String pathname, int prefixLength) {
        this.path = pathname;
        this.prefixLength = prefixLength;
    }
    
    private File(String child, File parent) {
        assert parent.path != null;
        assert (!parent.path.equals(""));
        this.path = fs.resolve(parent.path, child);
        this.prefixLength = parent.prefixLength;
    }
    
    public File(String pathname) {
        if (pathname == null) {
            throw new NullPointerException();
        }
        this.path = fs.normalize(pathname);
        this.prefixLength = fs.prefixLength(this.path);
    }
    
    public File(String parent, String child) {
        if (child == null) {
            throw new NullPointerException();
        }
        if (parent != null) {
            if (parent.equals("")) {
                this.path = fs.resolve(fs.getDefaultParent(), fs.normalize(child));
            } else {
                this.path = fs.resolve(fs.normalize(parent), fs.normalize(child));
            }
        } else {
            this.path = fs.normalize(child);
        }
        this.prefixLength = fs.prefixLength(this.path);
    }
    
    public File(File parent, String child) {
        if (child == null) {
            throw new NullPointerException();
        }
        if (parent != null) {
            if (parent.path.equals("")) {
                this.path = fs.resolve(fs.getDefaultParent(), fs.normalize(child));
            } else {
                this.path = fs.resolve(parent.path, fs.normalize(child));
            }
        } else {
            this.path = fs.normalize(child);
        }
        this.prefixLength = fs.prefixLength(this.path);
    }
    
    public File(URI uri) {
        if (!uri.isAbsolute()) throw new IllegalArgumentException("URI is not absolute");
        if (uri.isOpaque()) throw new IllegalArgumentException("URI is not hierarchical");
        String scheme = uri.getScheme();
        if ((scheme == null) || !scheme.equalsIgnoreCase("file")) throw new IllegalArgumentException("URI scheme is not \"file\"");
        if (uri.getAuthority() != null) throw new IllegalArgumentException("URI has an authority component");
        if (uri.getFragment() != null) throw new IllegalArgumentException("URI has a fragment component");
        if (uri.getQuery() != null) throw new IllegalArgumentException("URI has a query component");
        String p = uri.getPath();
        if (p.equals("")) throw new IllegalArgumentException("URI path component is empty");
        p = fs.fromURIPath(p);
        if (File.separatorChar != '/') p = p.replace('/', File.separatorChar);
        this.path = fs.normalize(p);
        this.prefixLength = fs.prefixLength(this.path);
    }
    
    public native String getName();
    
    public native String getParent();
    
    public native File getParentFile();
    
    public native String getPath();
    
    public native boolean isAbsolute();
    
    public native String getAbsolutePath();
    
    public native File getAbsoluteFile();
    
    public native String getCanonicalPath() throws IOException;
    
    public native File getCanonicalFile() throws IOException;
    
    private static native String slashify(String path, boolean isDirectory);
    
    public native URL toURL() throws MalformedURLException;
    
    public native URI toURI();
    
    public native boolean canRead();
    
    public native boolean canWrite();
    
    public native boolean exists();
    
    public native boolean isDirectory();
    
    public native boolean isFile();
    
    public native boolean isHidden();
    
    public native long lastModified();
    
    public native long length();
    
    public native boolean createNewFile() throws IOException;
    
    public native boolean delete();
    
    public native void deleteOnExit();
    
    public native String[] list();
    
    public native String[] list(FilenameFilter filter);
    
    public native File[] listFiles();
    
    public native File[] listFiles(FilenameFilter filter);
    
    public native File[] listFiles(FileFilter filter);
    
    public native boolean mkdir();
    
    public native boolean mkdirs();
    
    public native boolean renameTo(File dest);
    
    public native boolean setLastModified(long time);
    
    public native boolean setReadOnly();
    
    public native boolean setWritable(boolean writable, boolean ownerOnly);
    
    public native boolean setWritable(boolean writable);
    
    public native boolean setReadable(boolean readable, boolean ownerOnly);
    
    public native boolean setReadable(boolean readable);
    
    public native boolean setExecutable(boolean executable, boolean ownerOnly);
    
    public native boolean setExecutable(boolean executable);
    
    public native boolean canExecute();
    
    public static native File[] listRoots();
    
    public native long getTotalSpace();
    
    public native long getFreeSpace();
    
    public native long getUsableSpace();
    
    private static class TempDirectory {
        
        private TempDirectory() {
        }
        private static final File tmpdir = null;
        
        static native File location();
        private static final SecureRandom random = null;
        
        static native File generateFile(String prefix, String suffix, File dir) throws IOException;
    }
    
    public static native File createTempFile(String prefix, String suffix, File directory) throws IOException;
    
    public static native File createTempFile(String prefix, String suffix) throws IOException;
    
    public native int compareTo(File pathname);
    
    public native boolean equals(Object obj);
    
    public native int hashCode();
    
    public native String toString();
    
    private synchronized native void writeObject(java.io.ObjectOutputStream s) throws IOException;
    
    private synchronized native void readObject(java.io.ObjectInputStream s) throws IOException, ClassNotFoundException;
    private static final long serialVersionUID = 0L;
    private volatile transient Path filePath;
    
    public native Path toPath();
}