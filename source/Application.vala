/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2022 Vítor Fernandes <vitor_resende@ymail.com>
 */
 
public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "io.github.vtorbr.disk_space",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    protected override void activate () {
        var file_title = new Gtk.Label (_("Select a folder: "))
        {
            halign = Gtk.Align.END
        };
        
        var file_button = new Gtk.FileChooserButton (
            _("Select folder"),
            Gtk.FileChooserAction.SELECT_FOLDER
        );
        
        var start_button = new Gtk.Button.with_label (_("Start")) {
            sensitive = false
        };
        
        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6,
            column_spacing = 6,
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER
        };
        
        var main_window = new Gtk.ApplicationWindow (this) {
            default_width = 800,
            default_height = 600,
            title = _("Disk Space")
        };
        
        grid.attach(file_title, 0, 2);
        grid.attach(file_button, 1, 2);
        grid.attach(start_button, 0, 3, 2, 1);
        
        main_window.add (grid);
        
        file_button.selection_changed.connect (() => {
            start_button.sensitive = file_button.get_filename() != null;
        });
        
        start_button.clicked.connect (() => {
            file_button.sensitive = false;
            message (file_button.get_filename());
        });
        
        main_window.show_all ();
    }
    
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}

