public class SciMark4J {
    static {
        System.loadLibrary("jniscimark4-" + System.getProperty("os.arch"));
    }

    public static void main(String[] args) {
        new SciMark4J().run();
    }

    private native void run();
}
