/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2022 Vítor Fernandes <vitor_resende@ymail.com>
 */
 
 public class MyWindow : Gtk.ApplicationWindow {
     public MyWindow (Gtk.Application app) {
         Object (
             application: app
         );
     }
     
     construct {
        this.default_width = 800;
        this.default_height = 600;
        this.title = _("Disk Space");
        
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
        
        grid.attach(file_title, 0, 2);
        grid.attach(file_button, 1, 2);
        grid.attach(start_button, 0, 3, 2, 1);
        
        this.add (grid);
        
        file_button.selection_changed.connect (() => {
            start_button.sensitive = file_button.get_filename() != null;
        });
        
        start_button.clicked.connect (() => {
            file_button.sensitive = false;
            message (file_button.get_filename());
        });
     }
 }
 
