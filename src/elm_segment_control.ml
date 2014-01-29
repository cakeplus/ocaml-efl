external add : Evas.obj -> Evas.obj = "ml_elm_segment_control_add"

external item_add :
  Evas.obj -> ?icon:Evas.obj -> ?label:string -> unit -> Elm_object.item =
    "ml_elm_segment_control_item_add"

external item_insert_at :
  Evas.obj -> ?icon:Evas.obj -> ?label:string -> int -> Elm_object.item =
    "ml_elm_segment_control_item_insert_at"

external item_del_at : Evas.obj -> int -> unit =
  "ml_elm_segment_control_item_del_at"

external item_count_get : Evas.obj -> int =
  "ml_elm_segment_control_item_count_get"

external item_get : Evas.obj -> int -> Elm_object.item option =
  "ml_elm_segment_control_item_get"

external item_label_get : Evas.obj -> int -> string option =
  "ml_elm_segment_control_item_label_get"
