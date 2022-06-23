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
        var welcome_widget = new Granite.Widgets.Welcome (
            _("No Folder Selected"),
            _("Select a folder to begin.")
        );
        
        welcome_widget.append ("folder-open", _("Select folder"), _("Select a folder to analyze."));
        welcome_widget.activated.connect ((index) => {
            switch (index) {
                case 0:
                    var folder_chooser = new Gtk.FileChooserNative (
                        _("Select Folder"),
                        this,
                        Gtk.FileChooserAction.SELECT_FOLDER,
                        _("Select"),
                        _("Cancel")
                    );
                    
                    if (folder_chooser.run () == Gtk.ResponseType.ACCEPT) {
                        folder_chooser.visible = false;
                        message (folder_chooser.get_filename ());
                        folder_chooser.destroy ();
                    }
                    
                    break;
            }
        });
        
        this.default_width = 800;
        this.default_height = 600;
        this.title = _("Disk Space");
        this.add (welcome_widget);
    }
}

