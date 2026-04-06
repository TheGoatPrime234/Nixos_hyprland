use relm4::{gtk, ComponentParts, ComponentSender, RelmApp, SimpleComponent};
use relm4::gtk::prelude::*;
use relm4::RelmWidgetExt;
use std::fs;
use std::process::Command;

#[derive(Debug)]
enum AppMsg {
    SelectTheme(String),
    RebuildSystem(String, String, bool), 
}

struct AppModel;

#[relm4::component]
impl SimpleComponent for AppModel {
    type Init = ();
    type Input = AppMsg;
    type Output = ();

    view! {
        gtk::Window {
            set_title: Some("Control Center"),
            set_default_size: (350, 450),
            add_css_class: "theme-switcher-window",

            gtk::Box {
                set_orientation: gtk::Orientation::Vertical,
                set_spacing: 0,

                gtk::StackSwitcher {
                    set_margin_all: 12,
                    set_halign: gtk::Align::Center,
                    set_stack: Some(&main_stack), 
                },

                #[name = "main_stack"]
                gtk::Stack {
                    set_vexpand: true, 
                    set_transition_type: gtk::StackTransitionType::SlideLeftRight,

                    add_titled[Some("themes"), "Themes"] = &gtk::Box {
                        set_orientation: gtk::Orientation::Vertical,
                        set_margin_all: 24,
                        
                        #[name = "theme_box"]
                        gtk::Box {
                            set_orientation: gtk::Orientation::Vertical,
                            set_spacing: 12,
                        }
                    },

                    add_titled[Some("system"), "System"] = &gtk::Box {
                        set_orientation: gtk::Orientation::Vertical,
                        set_margin_all: 24,
                        set_spacing: 16,
                        set_valign: gtk::Align::Center, 

                        gtk::Label {
                            set_label: "NixOS Konfiguration",
                            add_css_class: "title-label", 
                        },

                        #[name = "host_entry"]
                        gtk::Entry {
                            set_placeholder_text: Some("Host (nixos/desktop/chromebook)"),
                            set_text: "desktop",
                        },

                        #[name = "msg_entry"]
                        gtk::Entry {
                            set_placeholder_text: Some("Commit Message (Optional)"),
                        },

                        #[name = "verbose_check"]
                        gtk::Entry {
                            set_placeholder_text: Some("Verbose"),
                            set_active: false,
                        },

                        gtk::Button {
                            set_label: "System Rebuild starten",
                            add_css_class: "rebuild-button",
                            connect_clicked[host_entry, msg_entry, verbose_check] => AppMsg::RebuildSystem(
                                host_entry.text().to_string(),
                                msg_entry.text().to_string(),
                                verbose_check.is_active()
                            ),
                        }
                    }
                }
            }
        }
    }

    fn init(
        _init: Self::Init,
        root: Self::Root,
        sender: ComponentSender<Self>,
    ) -> ComponentParts<Self> {
        let model = AppModel;
        let widgets = view_output!();
        let theme_dir = "/home/cato/.config/rice/themes";
        
        if let Ok(entries) = fs::read_dir(theme_dir) {
            for entry in entries.flatten() {
                if let Ok(file_type) = entry.file_type() {
                    if file_type.is_dir() {
                        let theme_name = entry.file_name().to_string_lossy().to_string();
                        
                        let mut ui_name = theme_name.clone();
                        if let Some(r) = ui_name.get_mut(0..1) { r.make_ascii_uppercase(); }

                        let btn = gtk::Button::with_label(&ui_name);
                        let sender_clone = sender.clone();
                        let name_clone = theme_name.clone();
                        
                        btn.connect_clicked(move |_| {
                            sender_clone.input(AppMsg::SelectTheme(name_clone.clone()));
                        });
                        
                        widgets.theme_box.append(&btn);
                    }
                }
            }
        } else {
            let error_btn = gtk::Button::with_label("Ordner nicht gefunden");
            widgets.theme_box.append(&error_btn);
        }
        
        ComponentParts { model, widgets }
    }

    fn update(&mut self, msg: Self::Input, _sender: ComponentSender<Self>) {
        match msg {
            AppMsg::SelectTheme(theme_name) => {
                let theme_lower = theme_name.to_lowercase();
                let script_path = format!("/home/cato/.config/rice/themes/{}/apply_theme.sh", theme_lower);

                let result = Command::new("sh")
                    .arg(&script_path)
                    .spawn();
                if let Err(e) = result {
                    println!("Fehler beim Ausführen von {}: {}", script_path, e);
                }
            }
            
            AppMsg::RebuildSystem(host, msg, verbose) => {
                println!("Starte Rebuilde {} {} {}", host, msg, verbose);

                let script_path = "/home/cato/nixos-config/rebuild.sh";
                if verbose {
                    let mut cmd = Command::new("kitty");
                    cmd
                        .arg("-e")
                        .arg("sh")
                        .arg(script_path)
                        .arg("-h")
                        .arg(&host)
                        .arg("-v");

                    if !msg.is_empty() {
                        cmd
                            .arg("-m")
                            .arg(&msg);
                    }
                } else {
                    let mut cmd = Command::new("sh");
                    cmd 
                        .arg(script_path)
                        .arg("-h")
                        .arg(&host);

                        if !msg.is_empty() {
                            cmd
                                .arg("-m")
                                .arg(&msg);
                        }

                        if let Err(e) = cmd.spawn() {
                            println!("Fehler beim ausführen {}", e);
                        }
                    }
                
            }
        }
    }
}

fn main() {
    let app = RelmApp::new("de.controlcenter");
    app.run::<AppModel>(());
}