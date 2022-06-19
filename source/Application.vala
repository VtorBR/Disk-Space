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
        var first_button = new Gtk.Button.with_label (_("A button"));
        var first_label = new Gtk.Label (null);
        
        var second_button = new Gtk.Button.with_label (_("Another button"));
        var second_label = new Gtk.Label (_("Horizontal"));
        
        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6,
            column_spacing = 6,
        };
        
        var main_window = new Gtk.ApplicationWindow (this) {
            default_width = 800,
            default_height = 600,
            title = _("Disk Space")
        };
        
        grid.attach(first_button, 0, 0, 1, 1);
        grid.attach_next_to(first_label, first_button, Gtk.PositionType.RIGHT, 1, 1);
        
        grid.attach(second_button, 0, 1);
        grid.attach_next_to(second_label, second_button, Gtk.PositionType.RIGHT, 1, 1);
        
        main_window.add (grid);
        
        first_button.clicked.connect (() => {
            first_label.label = _("You clicked!");
            first_button.sensitive = false;
        });
        
        second_button.clicked.connect (() => {
            second_label.angle = 90;
            second_label.label = _("What?");
            second_button.sensitive = false;
        });
        
        main_window.show_all ();
    }
    
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}

