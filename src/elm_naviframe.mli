val add : Evas.obj -> Evas.obj

val item_push :
  Evas.obj -> ?title_label:string -> ?prev_btn:Evas.obj -> ?next_btn:Evas.obj ->
    Evas.obj -> ?item_style:string -> unit -> Elm_object.item

val item_simple_push : Evas.obj -> Evas.obj -> Elm_object.item

val item_insert_before :
  Evas.obj -> Elm_object.item -> ?title_label:string -> ?prev_btn:Evas.obj ->
    ?next_btn:Evas.obj -> Evas.obj -> ?item_style:string -> unit ->
    Elm_object.item

val item_title_visible_set : Elm_object.item -> bool -> unit

val item_simple_promote : Evas.obj -> Evas.obj -> unit

