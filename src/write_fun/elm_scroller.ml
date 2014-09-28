open Common

let policy = simple_ty "Elm_Scroller" "Policy"
let direction = simple_ty "Elm_Scroller" "Single_Direction"
let movement_block = flags_ty "Elm_Scroller" "Movement_Block"

let funs = [
  simple_unit "content_min_limit" [evas_object; bool; bool];
  simple_unit "region_show" [evas_object; int; int; int; int];
  simple_unit "policy_set" [evas_object; policy; policy];
  prop "single_direction" direction;
  simple_unit "page_snap_set" [evas_object; bool; bool];
  simple_unit "bounce_set" [evas_object; bool; bool];
  simple_unit "page_relative_set" [evas_object; double; double];
  simple_unit "page_size_set" [evas_object; int; int];
  simple_unit "page_scroll_limit_set" [evas_object; int; int];
  simple_unit "page_show" [evas_object; int; int];
  simple_unit "page_bring_in" [evas_object; int; int];
  simple_unit "region_bring_in" [evas_object; int; int; int; int];
  prop "propagate_events" bool;
  simple_unit "gravity_set" [evas_object; double; double];
  prop_flags "movement_block" movement_block;
]

