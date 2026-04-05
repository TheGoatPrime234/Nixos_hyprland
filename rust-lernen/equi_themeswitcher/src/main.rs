use std::process::Command;
use eframe::egui;


fn main() -> eframe::Result {
    env_logger::init();

    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_inner_size([400.0, 300.0]),
        ..Default::default()
    };

    eframe::run_native(
        "Erste Rust App auf Nix",
        options,
        Box::new(|_cc| Ok(Box::<MeineApp>::default())),
    )
}

#[derive(Default)]
struct MeineApp {
    theme: String,
}

fn reload_theme(theme_name: &str) {
    let apply = format!("/home/cato/.config/rice/themes/{}/apply_theme.sh", theme_name);
    Command::new("sh")
        .arg(apply)
        .spawn()
        .expect("Fehler beim anwenden");
    Command::new("sh")
        .arg("/home/cato/.config/rice/themes/reload_all.sh")
        .spawn()
        .expect("Fehler beim neuladen");
}

impl eframe::App for MeineApp {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("NixOs Themeswitcher");
            ui.separator();

            ui.label("Choose a Theme"); 
            egui::ScrollArea::vertical()
                .show(ui, |ui| {
                    let themes = ["Dracula", "Catpuccin", "Everforest"];
                    for theme in themes {
                        let is_selected = self.theme == theme;
                        if ui.selectable_label(is_selected, theme).clicked() {
                            self.theme = theme.to_string();
                            println!("Wechsel zu Theme {}", theme);
                        
                            if theme == "Dracula" {
                                reload_theme("dracula");
                            } else if theme == "Catpuccin" {
                                reload_theme("catpuccin");
                            } else if theme == "Everforest" {
                                reload_theme("everforest");
                            }
                        }
                    }
                });
        });
    }
}
