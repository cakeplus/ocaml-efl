include Henums.Elm_scroller

type movement_block_ = {
  vertical : bool;
  horizontal : bool;
}

module AF = Autofun.Elm_scroller.F (struct
  type evas_object = Evas.obj
  type elm_scroller_policy = policy
  type elm_scroller_single_direction = single_direction
  type elm_scroller_movement_block_list = movement_block list
  type elm_scroller_movement_block_ = movement_block_
end)
include AF

external add : Evas.obj -> Evas.obj = "ml_elm_scroller_add"

external policy_get : Evas.obj -> policy * policy = "ml_elm_scroller_policy_get"

external single_direction_get : Evas.obj -> single_direction =
  "ml_elm_scroller_single_direction_get"

external region_get : Evas.obj -> int * int * int * int =
  "ml_elm_scroller_region_get"

external child_size_get : Evas.obj -> int * int =
  "ml_elm_scroller_child_size_get"

external page_snap_get : Evas.obj -> bool * bool =
  "ml_elm_scroller_page_snap_get"

external bounce_get : Evas.obj -> bool * bool = "ml_elm_scroller_bounce_get"

external page_relative_get : Evas.obj -> float * float =
  "ml_elm_scroller_page_relative_get"

external page_size_get : Evas.obj -> int * int = "ml_elm_scroller_page_size_get"

external page_scroll_limit_get : Evas.obj -> int * int =
  "ml_elm_scroller_page_scroll_limit_get"

external current_page_get : Evas.obj -> int * int =
  "ml_elm_scroller_current_page_get"

external last_page_get : Evas.obj -> int * int =
  "ml_elm_scroller_last_page_get"

external gravity_get : Evas.obj -> float * float = "ml_elm_scroller_gravity_get"

