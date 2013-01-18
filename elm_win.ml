type ty = [`basic]

external add : ?p:Evas.obj -> string -> ty -> Evas.obj =
  "ml_elm_win_add"

external util_standard_add : string -> string -> Evas.obj =
  "ml_elm_win_util_standard_add"

external resize_object_add : Evas.obj -> Evas.obj -> unit =
  "ml_elm_win_resize_object_add"

external resize_object_del : Evas.obj -> Evas.obj -> unit =
  "ml_elm_win_resize_object_del"

external title_set : Evas.obj -> string -> unit = "ml_elm_win_title_set"

external title_get : Evas.obj -> string = "ml_elm_win_title_get"

external icon_name_set : Evas.obj -> string -> unit = "ml_elm_win_icon_name_set"

external icon_name_get : Evas.obj -> string = "ml_elm_win_icon_name_get"

external role_set : Evas.obj -> string -> unit = "ml_elm_win_role_set"

external role_get : Evas.obj -> string = "ml_elm_win_role_get"

external icon_object_set : Evas.obj -> Evas.obj -> unit =
  "ml_elm_win_icon_object_set"

external icon_object_get : Evas.obj -> Evas.obj = "ml_elm_win_icon_object_get"

external autodel_set : Evas.obj -> bool -> unit = "ml_elm_win_autodel_set"

external autodel_get : Evas.obj -> bool = "ml_elm_win_autodel_get"

external activate : Evas.obj -> unit = "ml_elm_win_activate"

external lower : Evas.obj -> unit = "ml_elm_win_lower"

external raises : Evas.obj -> unit = "ml_elm_win_raise"

external center : Evas.obj -> bool -> bool -> unit = "ml_elm_win_center"

external borderless_set : Evas.obj -> bool -> unit = "ml_elm_win_borderless_set"

external borderless_get : Evas.obj -> bool = "ml_elm_win_borderless_get"

external shaped_set : Evas.obj -> bool -> unit = "ml_elm_win_shaped_set"

external shaped_get : Evas.obj -> bool = "ml_elm_win_shaped_get"

external alpha_set : Evas.obj -> bool -> unit = "ml_elm_win_alpha_set"

