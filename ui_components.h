#ifndef UI_COMPONENTS_H
#define UI_COMPONENTS_H

#include <gtk/gtk.h>
#include <windows.h>
#include <time.h>

typedef struct {
    GtkWidget *window;
    GtkWidget *notebook;
    GtkWidget *chinese_walk_toggle;
    GtkWidget *quick_switch_toggle;
    GtkWidget *chinese_walk_trigger;
    GtkWidget *quick_switch_trigger;
    GtkWidget *delay_scale;
    gboolean chinese_walk_active;
    gboolean quick_switch_active;
} UIState;

void create_main_window(UIState *ui);
void create_tabs(UIState *ui);
void init_logging(void);
void log_message(const char *message);
BOOL is_elevated(void);
void update_file_properties(void);
char* generate_random_string(int length);
char* generate_random_version(void);

#endif 