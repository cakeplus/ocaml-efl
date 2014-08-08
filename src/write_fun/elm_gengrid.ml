open Common

let funs = [
  simple_unit "clear" [evas_object];
  prop "multi_select" bool;
  prop "multi_select_mode" bool;
  prop "horizontal" bool;
  prop ~args:[elm_object_item] "item_selected" bool;
  simple_unit "item_show" [elm_object_item; elm_gengrid_item_scrollto_type];
  simple_unit "item_bring_in" [elm_object_item; elm_gengrid_item_scrollto_type];
  simple_unit "item_update" [elm_object_item];
  simple "item_index_get" [elm_object_item] int;
  simple "items_count" [evas_object] int;
  simple_unit "item_tooltip_text_set" [elm_object_item; safe_string];
  simple_unit "item_tooltip_unset" [elm_object_item];
  prop ~args:[elm_object_item] "item_tooltip_style" safe_string;
  prop ~args:[elm_object_item] "item_tooltip_window_mode" bool;
  simple_unit "item_cursor_set" [elm_object_item; safe_string];
  simple_unit "item_cursor_unset" [elm_object_item];
  simple_unit "item_cursor_style_set" [elm_object_item; safe_string];
  prop ~args:[elm_object_item] "item_cursor_engine_only" bool;
  simple_unit "item_size_set" [evas_object; int; int];
  simple_unit "group_item_size_set" [evas_object; int; int];
  simple_unit "align_set" [evas_object; double; double];
  prop "reorder_mode" bool;
  simple_unit "page_show" [evas_object; int; int];
  prop "filled" bool;
  prop "select_mode" elm_object_select_mode;
  prop "highlight_mode" bool;
  prop ~args:[elm_object_item] "item_select_mode" elm_object_select_mode;
]
