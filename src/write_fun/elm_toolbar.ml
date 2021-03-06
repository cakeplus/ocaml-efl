open Common

let shrink_mode = simple_ty "Elm_Toolbar" "Shrink_Mode"
let item_state = simple_ty "Elm_Toolbar" "Item_State"

let funs = [
  prop "icon_size" int;
  prop "icon_order_lookup" Elm_icon.lookup_order;
  prop ~args:[elm_object_item] "item_priority" int;
  simple_unit "item_selected_set" [elm_object_item; bool];
  prop ~args:[elm_object_item] "item_icon" safe_string;
  simple "item_object_get" [elm_object_item] evas_object;
  prop ~args:[elm_object_item] "item_separator" bool;
  prop "shrink_mode" shrink_mode;
  prop "transverse_expanded" bool;
  prop "homogeneous" bool;
  simple_unit "menu_parent_set" [evas_object; evas_object];
  prop "align" double;
  simple_unit "item_menu_set" [elm_object_item; bool];
  simple "item_state_del" [elm_object_item; item_state] bool;
  simple "item_state_set" [elm_object_item; item_state] bool;
  prop "horizontal" bool;
  simple "items_count" [evas_object] int;
  prop "standard_priority" int;
  prop "select_mode" elm_object_select_mode;
  prop "reorder_mode" bool;
]

