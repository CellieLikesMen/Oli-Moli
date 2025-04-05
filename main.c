#include "ui_components.h"

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);
    
    UIState ui = {0};
    create_main_window(&ui);
    
    gtk_widget_show_all(ui.window);
    gtk_main();
    
    return 0;
} 