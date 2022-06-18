public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "io.github.vtorbr.disk-space",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    protected override void activate () {
        var label = new Gtk.Label ("OK");
        
        var main_window = new Gtk.ApplicationWindow (this) {
            default_width = 800,
            default_height = 600,
            title = "Disk Space"
        };
        
        main_window.add (label);
        main_window.show_all ();
    }
    
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}

