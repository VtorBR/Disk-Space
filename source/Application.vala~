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
        MyWindow main_window = new MyWindow(this);
        main_window.show_all ();
    }
    
    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}

